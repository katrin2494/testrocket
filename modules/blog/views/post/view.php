<?php

use yii\bootstrap\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\Post */

$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Posts', 'url' => ['index']];
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
            'title',
            'content:html',
            'date',
            [
                'label'=>"Comments",
                'format'=>'raw',
                'value' => Html::a('See all','@web/admin/blog/comment/index?Comment%5Bpost_id%5D='.$model->id),

            ],
            'post_image',
        ],
    ]) ?>
    </div>
</div>