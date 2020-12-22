<?php

namespace App\Repositories;

use App\Models\Cooperative;
use App\Repositories\BaseRepository;

/**
 * Class CooperativeRepository
 * @package App\Repositories
 * @version December 22, 2020, 5:55 pm UTC
*/

class CooperativeRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
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
        return Cooperative::class;
    }
}
