<?php

/* @var $this yii\web\View */

use yii\helpers\Html;
use naffiq\bridge\models\Settings;

$this->title = 'О нас';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-about">
    <div class="container">
        <h1><?= Html::encode($this->title) ?></h1>
        <?= Settings::getOrCreate('about_us_text', [
            'title' => 'Текст о нас',
            'type' => Settings::TYPE_TEXT,
        ]) ?>
    </div>
</div>
