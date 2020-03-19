<?php

use yii\bootstrap\Html;
use naffiq\bridge\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Post */
/* @var $form naffiq\bridge\widgets\ActiveForm */
?>

<?php $form = ActiveForm::begin(); ?>
<div class="row">
    <div class="col-md-8">

        <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'content')->richTextArea(['options' => ['rows' => 6]]) ?>

        <?= $form->field($model, 'date')->datePicker([
            'value'=> date("d.mm.Y"),
            'pluginOptions' => [
                'todayHighlight' => true,
                'format' => 'yyyy-mm-dd',
                'autoclose'=>true,
                'weekStart'=>1, //неделя начинается с понедельника
            ]
        ]) ?>

        <?= $form->field($model, 'post_image')->imageUpload() ?>

    </div>

    <div class="col-md-4">

    </div>
</div>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
<?php ActiveForm::end(); ?>
