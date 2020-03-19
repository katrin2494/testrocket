<?php
// @app/views/site/index.php

use naffiq\bridge\models\Settings;

/* @var $this yii\web\View */

$this->title = Yii::$app->name
?>

<div class="site-index">

    <div class="container">
        <div class="body-content">
            <div class="row">
                <?= Settings::getOrCreate('main_content_title', [
                    'title' => 'Заголовок на главной',
                    'type' => Settings::TYPE_TEXT,
                ]) ?>
                <?php foreach($posts as $post):?>
                    <div class="col-lg-4 col-md-6">
                        <?=  $this->render('/post/shortView', [
                            'model' => $post
                        ]);?>
                    </div>
                <?php endforeach;?>
            </div>
        </div>
    </div>
</div>
