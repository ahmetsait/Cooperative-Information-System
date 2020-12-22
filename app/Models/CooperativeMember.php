<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class CooperativeMember
 * @package App\Models
 * @version December 22, 2020, 5:57 pm UTC
 *
 * @property \App\Models\Cooperative $cooperative
 * @property \App\Models\Farmer $member
 * @property string $member_id
 * @property string|\Carbon\Carbon $registration
 */
class CooperativeMember extends Model
{
    use HasFactory;

    public $table = 'cooperativemember';
    protected $primaryKey = null;
    public $incrementing = false;
    public $timestamps = false;


    protected $dates = ['deleted_at'];



    public $fillable = [
        'member_id',
        'registration'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'cooperative_id' => 'integer',
        'member_id' => 'string',
        'registration' => 'datetime'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'member_id' => 'required|string|max:11',
        'registration' => 'required'
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function cooperative()
    {
        return $this->belongsTo(\App\Models\Cooperative::class, 'cooperative_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function member()
    {
        return $this->belongsTo(\App\Models\Farmer::class, 'member_id');
    }
}
