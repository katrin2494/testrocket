<?php
/**
 * Created by PhpStorm.
 * User: Katerina
 * Date: 14.03.2020
 * Time: 22:42
 */


$this->title = 'Новости';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="post_index">

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <? foreach ($posts as $post):?>
                    <?=  $this->render('/post/shortView', [
                        'model' => $post
                    ]);?>
                <? endforeach;?>

                <?= \yii\widgets\LinkPager::widget([
                    'pagination'=>$pages,
                    'hideOnSinglePage'=>true,
                    'options'=> [
                        'class'=>'pagination',
                    ],

                ])?>
            </div>
        </div>
        <div class="row recent_posts">
            <div class="col-lg-12">
                <h3>Последние новости:</h3>
            </div>
            <?php foreach($recentPosts as $recentPost):?>
                <div class="col-lg-4 col-md-6">
                    <?=  $this->render('/post/shortView', [
                        'model' => $recentPost
                    ]);?>
                </div>
            <?php endforeach;?>
        </div>

    </div>
</div>
