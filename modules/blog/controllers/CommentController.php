<?php

namespace app\modules\blog\controllers;

use naffiq\bridge\controllers\BaseAdminController;
use yii\helpers\ArrayHelper;
use yii2tech\admin\actions\Position;
use dosamigos\grid\actions\ToggleAction;

/**
 * CommentController implements the CRUD actions for [[app\models\Comment]] model.
 * @see app\models\Comment
 */
class CommentController extends BaseAdminController
{
    /**
     * @inheritdoc
     */
    public $modelClass = 'app\models\Comment';
    /**
     * @inheritdoc
     */
    public $searchModelClass = 'app\models\Search\Comment';

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
                    'modelClass' => 'app\models\Comment',
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
