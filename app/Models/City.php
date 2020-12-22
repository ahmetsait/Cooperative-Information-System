<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class City
 * @package App\Models
 * @version December 22, 2020, 5:50 pm UTC
 *
 * @property \Illuminate\Database\Eloquent\Collection $farms
 * @property \Illuminate\Database\Eloquent\Collection $cooperatives
 * @property string $name
 * @property number $area
 */
class City extends Model
{
    use HasFactory;

    public $table = 'cities';
    protected $primaryKey = 'code';
    public $incrementing = false;
    public $timestamps = false;

    public $fillable = [
        'name',
        'area'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'code' => 'integer',
        'name' => 'string',
        'area' => 'decimal:2'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required|string|max:100',
        'area' => 'required|numeric'
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function farms()
    {
        return $this->hasMany(\App\Models\Farm::class, 'city_code');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function cooperatives()
    {
        return $this->hasMany(\App\Models\Cooperative::class, 'city_code');
    }
}
