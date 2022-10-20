<?php

namespace App\Casts;

use Illuminate\Support\Facades\Crypt;

class EmailCast implements \Illuminate\Contracts\Database\Eloquent\CastsAttributes
{

    /**
     * Email shall be stored as an encrypted value (* not plan text)
     * algorithm (aes-128-gcm) linux algo
     * the password is application name
     *
     * @inheritDoc
     */
    public function get($model, string $key, $value, array $attributes)
    {
        return Crypt::decryptString($value);
    }

    /**
     * Email shall be return plan text value using this system,
     * with own algorithm with password the password is application name
     *
     * @inheritDoc
     */
    public function set($model, string $key, $value, array $attributes)
    {
        return Crypt::encryptString($value);
    }
}
