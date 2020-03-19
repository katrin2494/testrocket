<?php

use dosamigos\grid\GridView;
use yii2tech\admin\grid\ActionColumn;

/* @var $this yii\web\View */
/* @var $searchModel app\models\Search\Post */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Posts';
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
        'title',
        [
            'class' => 'naffiq\bridge\widgets\columns\TruncatedTextColumn',
            'attribute' => 'content',
        ],
        'date',
        [
            'class' => 'naffiq\bridge\widgets\columns\ImageColumn',
            'attribute' => 'post_image',
        ],
        [
            'class' => ActionColumn::className(),
        ],
    ],
]); ?>
