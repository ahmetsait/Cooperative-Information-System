<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class FarmCrop
 * @package App\Models
 * @version December 22, 2020, 5:54 pm UTC
 *
 * @property \App\Models\Farm $farm
 * @property \App\Models\Crop $crop
 * @property integer $crop_id
 * @property string $planting_date
 * @property number $area
 */
class FarmCrop extends Model
{
    use HasFactory;

    public $table = 'farmcrop';
    protected $primaryKey = null;
    public $incrementing = false;
    public $timestamps = false;

    public $fillable = [
        'farm_id',
        'crop_id',
        'planting_date',
        'area'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'farm_id' => 'integer',
        'crop_id' => 'integer',
        'planting_date' => 'date',
        'area' => 'decimal:3'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'farm_id' => 'required|integer',
        'crop_id' => 'required|integer',
        'planting_date' => 'required',
        'area' => 'required|numeric'
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function farm()
    {
        return $this->belongsTo(\App\Models\Farm::class, 'farm_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function crop()
    {
        return $this->belongsTo(\App\Models\Crop::class, 'crop_id');
    }
}
