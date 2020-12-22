<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * Class Cooperative
 * @package App\Models
 * @version December 22, 2020, 5:55 pm UTC
 *
 * @property \App\Models\Farmer $founder
 * @property \App\Models\Farmer $president
 * @property \App\Models\City $cityCode
 * @property \Illuminate\Database\Eloquent\Collection $farmer2s
 * @property string $name
 * @property string $establishment_date
 * @property string $founder_id
 * @property string $president_id
 * @property integer $city_code
 * @property string $address
 * @property string $email
 * @property integer $member_count
 */
class Cooperative extends Model
{
    use HasFactory;

    public $table = 'cooperatives';
    protected $primaryKey = 'id';
    public $incrementing = true;
    public $timestamps = false;



    public $fillable = [
        'name',
        'establishment_date',
        'founder_id',
        'president_id',
        'city_code',
        'address',
        'email',
        'member_count'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'name' => 'string',
        'establishment_date' => 'date',
        'founder_id' => 'string',
        'president_id' => 'string',
        'city_code' => 'integer',
        'address' => 'string',
        'email' => 'string',
        'member_count' => 'integer'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required|string|max:50',
        'establishment_date' => 'required',
        'founder_id' => 'nullable|string|max:11',
        'president_id' => 'nullable|string|max:11',
        'city_code' => 'nullable|integer',
        'address' => 'required|string|max:500',
        'email' => 'required|string|max:254',
        'member_count' => 'required|integer'
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function founder()
    {
        return $this->belongsTo(\App\Models\Farmer::class, 'founder_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function president()
    {
        return $this->belongsTo(\App\Models\Farmer::class, 'president_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     **/
    public function cityCode()
    {
        return $this->belongsTo(\App\Models\City::class, 'city_code');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     **/
    public function farmer2s()
    {
        return $this->belongsToMany(\App\Models\Farmer::class, 'cooperativemember');
    }
}
