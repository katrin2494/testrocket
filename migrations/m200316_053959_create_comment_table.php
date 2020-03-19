<?php

use yii\db\Migration;

/**
 * Handles the creation of table `comment`.
 */
class m200316_053959_create_comment_table extends Migration
{
    /**
     * @inheritdoc
     */
    public function up()
    {
        $this->createTable('comment', [
            'id' => $this->primaryKey(),
            'user_id' => $this->integer(),
            'post_id' => $this->integer()->notNull(),
            'text' => $this->string()->notNull(),
            'date' => $this->date()->notNull(),
            'status' => $this->smallInteger()->notNull()
        ]);

        $this->createIndex(
            'idx-user_id',
            'comment',
            'user_id'
        );

        $this->addForeignKey(
            'fk-comment-user_id',
            'comment',
            'user_id',
            'user',
            'id',
            'set null',
            'cascade'
        );

        $this->createIndex(
            'idx-post_id',
            'comment',
            'post_id'
        );

        $this->addForeignKey(
            'fk-comment-post_id',
            'comment',
            'post_id',
            'post',
            'id',
            'cascade'
        );
    }

    /**
     * @inheritdoc
     */
    public function down()
    {
        $this->dropForeignKey(
            'fk-comment-post_id',
            'comment'
        );

        $this->dropIndex(
            'idx-post_id',
            'comment'
        );

        $this->dropForeignKey(
            'fk-comment-user_id',
            'comment'
        );

        $this->dropIndex(
            'idx-user_id',
            'comment'
        );

        $this->dropTable('comment');
        echo "m200316_053959_create_comment_table was deleted.\n";

        return true;
    }
}
