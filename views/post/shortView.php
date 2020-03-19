<?php
/**
 * Created by PhpStorm.
 * User: Katerina
 * Date: 18.03.2020
 * Time: 10:20
 */
?>
<article class="post_wrap short">
    <img src="/media/post/<?= $model->id."/".$model->post_image?>" class="img-responsive">

    <h2><?= \yii\helpers\Html::a($model->title,['post/view','id'=>$model->id])?></h2>

    <p><?= $model->short?></p>
    <div class="post_info">
        <div class="date">
            <i class="fa fa-calendar"></i>
            <?= $model->date?>
        </div>
        <div class="comments">
            <i class="fa fa-comments-o"></i>
            <?= $model->commentsCount?>
        </div>
        <?= \yii\helpers\Html::a('Подробнее',['post/view','id'=>$model->id],['class'=>"more"])?>
    </div>
</article>