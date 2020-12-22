<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Farm
 * @package App\Models
 * @version December 22, 2020, 5:53 pm UTC
 *
 * @property \App\Models\Farmer $owner
 * @property \App\Models\City $cityCode
 * @property \App\Models\Soiltype $soilType
 * @property \Illuminate\Database\Eloquent\Collection $crops
 * @property string|\Carbon\Carbon $registration
 * @property string $owner_id
 * @property integer $city_code
 * @property number $latitude
 * @property number $longitude
 * @property number $area
 * @property integer $soil_type
 * @property number $unit_worth
 */
class Farm extends Model
{
    use HasFactory;

    public $table = 'farms';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = false;



    public $fillable = [
        'registration',
        'owner_id',
        'city_code',
        'latitude',
        'longitude',
        'area',
        'soil_type',
        'unit_worth'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'registration' => 'datetime',
        'owner_id' => 'string',
        'city_code' => 'integer',
        'latitude' => 'float',
        'longitude' => 'float',
        'area' => 'decimal:2',
        'soil_type' => 'integer',
        'unit_worth' => 'decimal:2'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'registration' => 'required',
        'owner_id' => 'nullable|string|max:11',
        'city_code' => 'nullable|integer',
        'latitude' => 'required|numeric',
        'longitude' => 'required|numeric',
        'area' => 'required|numeric',
        'soil_type' => 'nullable|integer',
        'unit_worth' => 'required|numeric'
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function owner()
    {
        return $this->belongsTo(\App\Models\Farmer::class, 'owner_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function cityCode()
    {
        return $this->belongsTo(\App\Models\City::class, 'city_code');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function soilType()
    {
        return $this->belongsTo(\App\Models\Soiltype::class, 'soil_type');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     **/
    public function crops()
    {
        return $this->belongsToMany(\App\Models\Crop::class, 'farmcrop');
    }
}
