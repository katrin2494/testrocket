<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "post".
 *
 * @property integer $id
 * @property string $title
 * @property string $content
 * @property string $date
 */
class Post extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'post';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'content', 'date'], 'required'],
            [['content'], 'string'],
            [['date'], 'safe'],
            [['title'], 'string', 'max' => 128],
            [['post_image'], 'file', 'on' => ['create', 'update'], 'extensions' => ['gif', 'jpg', 'png', 'jpeg']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'Title',
            'content' => 'Content',
            'date' => 'Date',
            'post_image' => 'Image',
        ];
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'post_imageUpload' => [
                'class' => 'mohorev\file\UploadImageBehavior',
                'attribute' => 'post_image',
                'path' => '@webroot/media/post/{id}',
                'url' => '@web/media/post/{id}',
                'scenarios' => ['create', 'update'],
                'thumbs' => ['thumb' => ['width' => 200, 'height' => 200, 'quality' => 90], 'preview' => ['width' => 50, 'height' => 50, 'quality' => 90]],
            ],
        ];
    }

    public function getShort(){
        $postfix='...';
        if ( strlen($this->content) <= 300)
            return $this->content;

        $temp = substr($this->content, 0, 300);
        return substr($temp, 0, strrpos($temp, ' ') ) . $postfix;
    }

    public function getComments(){

        return $this->hasMany(Comment::className(), ['post_id'=>'id']);

    }

    public function getPostComments(){

        return $this->getComments()->where(['>', 'status', 0])->all();
    }

    public function getCommentsCount(){

        return $this->getComments()->where(['>', 'status', 0])->count();

    }

}
