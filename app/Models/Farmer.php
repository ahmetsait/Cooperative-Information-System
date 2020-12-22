<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Farmer
 * @package App\Models
 * @version December 22, 2020, 5:50 pm UTC
 *
 * @property \Illuminate\Database\Eloquent\Collection $farms
 * @property \Illuminate\Database\Eloquent\Collection $cooperatives
 * @property \Illuminate\Database\Eloquent\Collection $cooperative1s
 * @property \Illuminate\Database\Eloquent\Collection $cooperative2s
 * @property string|\Carbon\Carbon $registration
 * @property string $name
 * @property string $surname
 * @property string $birthday
 * @property string $phone
 * @property string $email
 * @property string $address
 * @property integer $experience
 */
class Farmer extends Model
{
    use HasFactory;

    public $table = 'farmers';
    protected $primaryKey = 'id';
    public $incrementing = false;
    public $timestamps = false;


    public $fillable = [
        'registration',
        'name',
        'surname',
        'birthday',
        'phone',
        'email',
        'address',
        'experience'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'string',
        'registration' => 'datetime',
        'name' => 'string',
        'surname' => 'string',
        'birthday' => 'date',
        'phone' => 'string',
        'email' => 'string',
        'address' => 'string',
        'experience' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'registration' => 'required',
        'name' => 'required|string|max:100',
        'surname' => 'required|string|max:100',
        'birthday' => 'required',
        'phone' => 'nullable|string|max:20',
        'email' => 'nullable|string|max:254',
        'address' => 'required|string|max:500',
        'experience' => 'required|integer'
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function farms()
    {
        return $this->hasMany(\App\Models\Farm::class, 'owner_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function cooperatives()
    {
        return $this->hasMany(\App\Models\Cooperative::class, 'founder_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function cooperative1s()
    {
        return $this->hasMany(\App\Models\Cooperative::class, 'president_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     **/
    public function cooperative2s()
    {
        return $this->belongsToMany(\App\Models\Cooperative::class, 'cooperativemember');
    }
}
