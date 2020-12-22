<?php

namespace App\Repositories;

use App\Models\Farmer;
use App\Repositories\BaseRepository;

/**
 * Class FarmerRepository
 * @package App\Repositories
 * @version December 22, 2020, 5:50 pm UTC
*/

class FarmerRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
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
        return Farmer::class;
    }
}
