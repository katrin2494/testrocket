<?php

namespace app\models;

/**
 * Override user logic here
 *
 * @package app\models
 */
class User extends \Da\User\Model\User
{

    public $image = "";
    /**
     * Returns password age in days
     * @return integer
     */
    public function getPassword_age()
    {
        if (is_null($this->password_changed_at)) {
            return $this->getModule()->maxPasswordAge;
        }
        $d = new \DateTime("@{$this->password_changed_at}");
        return $d->diff(new \DateTime(), true)->format("%a");
    }
}