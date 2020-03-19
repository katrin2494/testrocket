<?php
/**
 * Created by PhpStorm.
 * User: Katerina
 * Date: 15.03.2020
 * Time: 22:06
 */

use yii\bootstrap\Html;
use naffiq\bridge\widgets\ActiveForm;
use kartik\social\GithubPlugin;
use kartik\social\VKPlugin;


$this->title = $model->title;
$this->params['breadcrumbs'][] = ['label' => 'Новости', 'url' => ['post/index']];
$this->params['breadcrumbs'][] = $model->title;
?>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <article class="post_wrap full">
                <h1><?= $model->title;?></h1>

                <div class="post_info">
                    <div class="date">
                        <i class="fa fa-calendar"></i>
                        <?= $model->date?>
                    </div>
                    <div class="comments">
                        <i class="fa fa-comments-o"></i>
                        <?= $model->commentsCount?> комментариев
                    </div>
                </div>
                <img src="/media/post/<?= $model->id."/".$model->post_image?>" class="img-responsive">

                <p><?= $model->content?></p>
            </article>

            <div class="share_wrap">
                <p>Поделиться в соц.сетях</p>
                <div class="ya-share2" data-services="vkontakte,facebook,odnoklassniki,moimir,twitter,telegram"></div>

    <!--            --><?//= GithubPlugin::widget(['type'=>GithubPlugin::WATCH, 'settings' => ['user'=>'Katrin2494', 'repo'=>'first.git']]);?>
    <!--            --><?//= VKPlugin::widget(['apiId'=>'7361199', 'type'=>VKPlugin::LIKE]);?>
            </div>

            <div class="comments_wrap">
                <h3>Комментарии (<?= $model->commentsCount?>)</h3>
                <?php if(!empty($comments)){?>
                    <?php foreach ($comments as $comment):?>
                        <blockquote class="comment_wrap">
                            <div class="avatar" style="background-image: url('/media/settings/5/5e719ee494653.jpg')">
                            </div>
                            <div class="text">
                                <div class="comment_info">
                                    <div class="author"><?= $comment->user->username?></div>
                                    <div class="date"><?= $comment->date?></div>
                                </div>
                                <?= $comment->text;?>
                            </div>
                        </blockquote>
                    <?php endforeach;?>
                <?php }else{?>
                    <p>Пока нет комментариев. Станьте первым</p>
                <?php }?>

                <?php if(!Yii::$app->user->isGuest){?>
                    <div class="leave_comment_form">
                        <h4>Оставьте комментарий</h4>
                        <div class="alert alert-success alert-dismissible" role="alert" style="display: none;">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>Ваш комментарий скоро будет добавлен!
                        </div>
                        <div class="alert alert-danger alert-dismissible" role="alert" style="display: none;">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>Ошибка при добавлении комментария. Попробуйте снова
                        </div>

                        <?php $form = ActiveForm::begin([
                            'options'=> ['class'=>'form-horizontal contact-form', 'role'=>'form']
                        ])?>
                        <?= $form->field($commentForm, 'text')->textarea(['class' => 'form-control','placeholder'=>'Напишите свой комментарий']) ?>
                        <?= $form->field($commentForm, 'post_id')->hiddenInput(['value' => $model->id])->label(false)?>
                        <?= $form->field($commentForm, 'reCaptcha')->widget(
                            \himiklab\yii2\recaptcha\ReCaptcha2::className(),
                            [
                                'siteKey' => '6LdsmeEUAAAAAIc-5edK8SBELde5sRuS1dUxSOMs', // unnecessary is reCaptcha component was set up
                            ]
                        )->label(false) ?>

                        <div class="form-group text-center">
                            <?= Html::submitButton('Оставить комментарий', ['class' => 'btn btn-primary', 'name' => 'contact-button']) ?>
                        </div>

                        <?php ActiveForm::end(); ?>
                    </div>
                <?php }else{?>
                    <p>Комментарии могут оставлять только зарегистрированные пользователи.</p>
                <?php }?>

            </div>
        </div>
    </div>
    <div class="row recent_posts">
        <div class="col-lg-12">
            <h3>Последние новости:</h3>
        </div>
        <?php foreach($recentPosts as $recentPost):?>
            <div class="col-lg-4 col-md-4">
                <?=  $this->render('/post/shortView', [
                    'model' => $recentPost
                ]);?>
            </div>
        <?php endforeach;?>
    </div>
</div>

<?php
$js = <<<JS
$('form').on('beforeSubmit', function(){
    var data = $(this).serialize();
    $.ajax({
        url: '/post/comment',
        type: 'POST',
        data: data,
        success: function(res){
            $('.alert-success').show();
        },
        error: function (jqXHR, exception) {
            $('.alert-danger').show();
        },  
    });
    return false;
});
JS;

$this->registerJs($js);
$this->registerJsFile('https://yastatic.net/es5-shims/0.0.2/es5-shims.min.js');
$this->registerJsFile('https://yastatic.net/share2/share.js');
?>