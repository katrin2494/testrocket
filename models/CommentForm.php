<?php
/**
 * Created by PhpStorm.
 * User: Katerina
 * Date: 16.03.2020
 * Time: 14:11
 */

namespace app\models;


use yii\base\Model;

class CommentForm extends Model
{

    public $text;
    public $post_id;
    public $reCaptcha;

    public function rules()
    {
        return [
            [['text','post_id'], 'required'],
            ['text', 'string','length' => [3,250]],
            ['post_id','integer'],
            [['reCaptcha'], \himiklab\yii2\recaptcha\ReCaptchaValidator2::className(),
                'secret' => '6LdsmeEUAAAAAIc-5edK8SBELde5sRuS1dUxSOMs', // unnecessary if reСaptcha is already configured
                'uncheckedMessage' => 'Please confirm that you are not a bot.'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'text' => 'Комментарий',
        ];
    }

    public function saveComment(){
        $comment = new Comment();
        $comment->text = $this->text;
        $comment->user_id = \Yii::$app->user->id;
        $comment->post_id = $this->post_id;
        $comment->date = date("Y-m-d");
        $comment->status = $comment::STATUS_UNPUBLISHED;
        return $comment->save();
    }

}