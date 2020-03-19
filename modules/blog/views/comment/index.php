<?php

use dosamigos\grid\GridView;
use yii2tech\admin\grid\ActionColumn;

/* @var $this yii\web\View */
/* @var $searchModel app\models\Search\Comment */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Comments';
$this->params['breadcrumbs'][] = $this->title;
$this->params['contextMenuItems'] = [
    ['create'],
];
?>

<?= GridView::widget([
    'dataProvider' => $dataProvider,
    'options' => ['class' => 'grid-view table-responsive'],
    'behaviors' => [
        \dosamigos\grid\behaviors\ResizableColumnsBehavior::className()
    ],
    'filterModel' => $searchModel,
    'columns' => [
        ['class' => 'yii\grid\SerialColumn'],

        'id',
        'user_id',
        'post_id',
        'text',
        'date',
        [
            'label'=>'Status',
            'attribute'=>'status',
            'value'=> function($data){
                return ($data->status==\app\models\Comment::STATUS_UNPUBLISHED) ? 'Unpublished' : 'Published';
            },
        ],
        [
            'class' => ActionColumn::className(),
        ],
    ],
]); ?>
