<?php

namespace App\Repositories;

use App\Models\SoilType;
use App\Repositories\BaseRepository;

/**
 * Class SoilTypeRepository
 * @package App\Repositories
 * @version December 22, 2020, 5:51 pm UTC
*/

class SoilTypeRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'name'
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
        return SoilType::class;
    }
}
