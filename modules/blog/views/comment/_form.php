<?php

use yii\bootstrap\Html;
use naffiq\bridge\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Comment */
/* @var $form naffiq\bridge\widgets\ActiveForm */
?>

<?php $form = ActiveForm::begin(); ?>
<div class="row">
    <div class="col-md-8">

        <?= $form->field($model, 'user_id')->textInput(['disabled'=>!$new]) ?>

        <?= $form->field($model, 'post_id')->textInput(['disabled'=>!$new]) ?>

        <?= $form->field($model, 'text')->textInput(['maxlength' => true]) ?>

        <?= $form->field($model, 'date')->datePicker([
            'value'=> date("d.mm.Y"),
            'pluginOptions' => [
                'todayHighlight' => true,
                'format' => 'yyyy-mm-dd',
                'autoclose'=>true,
                'weekStart'=>1, //неделя начинается с понедельника
            ]
        ]) ?>

        <?= $form->field($model, 'status')->checkbox([])->label('Published') ?>


    </div>

    <div class="col-md-4">

    </div>
</div>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
<?php ActiveForm::end(); ?>
