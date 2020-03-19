<?php

use yii\bootstrap\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Comment */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Comments', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
$this->params['contextMenuItems'] = [
    ['update', 'id' => $model->id],
    ['delete', 'id' => $model->id]
];
?>
<div class="row">
    <div class="col-lg-8 detail-view-wrap">

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            [
                'label'=>'Author',
                'attribute'=>'user_id',
                'value'=> $model->user->username,
            ],
            [
                'label'=>'Post',
                'attribute'=>'post_id',
                'value'=> $model->post->id.": ".$model->post->title,
            ],
            'text',
            'date',
            [
                'label'=>'Status',
                'attribute'=>'status',
                'value'=> function($data){
                    return ($data->status==\app\models\Comment::STATUS_UNPUBLISHED) ? 'Unpublished' : 'Published';
                },
            ],
        ],
    ]) ?>
    </div>
</div>