<?php

namespace app\modules\blog\controllers;

use naffiq\bridge\controllers\BaseAdminController;
use yii\helpers\ArrayHelper;
use yii2tech\admin\actions\Position;
use dosamigos\grid\actions\ToggleAction;

/**
 * PostController implements the CRUD actions for [[app\models\Post]] model.
 * @see app\models\Post
 */
class PostController extends BaseAdminController
{
    /**
     * @inheritdoc
     */
    public $modelClass = 'app\models\Post';
    /**
     * @inheritdoc
     */
    public $searchModelClass = 'app\models\Search\Post';

    /**
     * @inheritdoc
     */
    public $createScenario = 'create';
    /**
     * @inheritdoc
     */
    public $updateScenario = 'update';


    /**
     * @inheritdoc
     */
    public function actions()
    {
        return ArrayHelper::merge(
            parent::actions(),
            [
                'toggle' => [
                    'class' => ToggleAction::className(),
                    'modelClass' => 'app\models\Post',
                    'onValue' => 1,
                    'offValue' => 0
                ],
                'position' => [
                    'class' => Position::className(),
                ],
            ]
        );
    }
}
