<?php

namespace App\Repositories;

use App\Models\Farm;
use App\Repositories\BaseRepository;

/**
 * Class FarmRepository
 * @package App\Repositories
 * @version December 22, 2020, 5:53 pm UTC
*/

class FarmRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
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
     * Return searchable fields
     *
     * @return array
     */
    public function getFieldsSearchable()
    {
        return $this->fieldSearchable;
    }

    /**
     * Configure the Model
     **/
    public function model()
    {
        return Farm::class;
    }
}
