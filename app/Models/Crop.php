<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Crop
 * @package App\Models
 * @version December 22, 2020, 5:53 pm UTC
 *
 * @property \Illuminate\Database\Eloquent\Collection $farms
 * @property string $name
 * @property string $category
 * @property number $seed_unit_price
 * @property number $crop_standard_price
 * @property integer $experience
 */
class Crop extends Model
{
    use HasFactory;

    public $table = 'crops';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = false;

    public $fillable = [
        'name',
        'category',
        'seed_unit_price',
        'crop_standard_price',
        'experience'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'name' => 'string',
        'category' => 'string',
        'seed_unit_price' => 'decimal:2',
        'crop_standard_price' => 'decimal:2',
        'experience' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required|string|max:50',
        'category' => 'required|string|max:20',
        'seed_unit_price' => 'nullable|numeric',
        'crop_standard_price' => 'nullable|numeric',
        'experience' => 'nullable|integer'
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     **/
    public function farms()
    {
        return $this->belongsToMany(\App\Models\Farm::class, 'farmcrop');
    }
}
