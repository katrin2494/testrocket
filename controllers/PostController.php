<?php
/**
 * Created by PhpStorm.
 * User: Katerina
 * Date: 14.03.2020
 * Time: 22:39
 */

namespace app\controllers;


use app\models\CommentForm;
use app\models\Post;
use yii\data\Pagination;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

class PostController extends Controller
{
    /**
     * Lists all Post models.
     * @return mixed
     */
    public function actionIndex()
    {
        $query = Post::find();
        $pages = new Pagination(['totalCount' => $query->count(),'pageSize'=>2, 'forcePageParam' => false, 'pageSizeParam' => false]);
        $recentPosts = Post::find()->limit(5)->orderBy('date')->all();

        $posts = $query->offset($pages->offset)
            ->limit($pages->limit)
            ->all();

        return $this->render('index', [
            'posts' => $posts,
            'pages'=>$pages,
            'recentPosts' => $recentPosts
        ]);
    }

    /**
     * Displays a single Post model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        $model = $this->findModel($id);
        $recentPosts = Post::find()->limit(5)->orderBy('date')->all();
        $comments = $model->getPostComments();
        $commentForm = new CommentForm();
        return $this->render('view', [
            'model' => $model,
            'comments' => $comments,
            'commentForm' => $commentForm,
            'recentPosts' => $recentPosts
        ]);
    }
    /**
     * Displays a single Post model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionComment(){
        $model = new CommentForm();

        if(\Yii::$app->request->isAjax){
            $model->load(\Yii::$app->request->post());
            if($model->saveComment()){
                \Yii::$app->getSession()->setFlash('comment','Ваш комментарий скоро будет добавлен!');
            }
        }
    }

    /**
     * Finds the Post model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Post the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Post::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested post does not exist.');
    }
}