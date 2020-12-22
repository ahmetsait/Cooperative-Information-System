<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class SoilType
 * @package App\Models
 * @version December 22, 2020, 5:51 pm UTC
 *
 * @property \Illuminate\Database\Eloquent\Collection $farms
 * @property string $name
 */
class SoilType extends Model
{
    use HasFactory;

    public $table = 'soiltypes';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = false;


    public $fillable = [
        'name'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'name' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required|string|max:100'
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     **/
    public function farms()
    {
        return $this->hasMany(\App\Models\Farm::class, 'soil_type');
    }
}
