<?php

namespace App\Repositories;

use App\Models\CooperativeMember;
use App\Repositories\BaseRepository;

/**
 * Class CooperativeMemberRepository
 * @package App\Repositories
 * @version December 22, 2020, 5:57 pm UTC
*/

class CooperativeMemberRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'member_id',
        'registration'
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
        return CooperativeMember::class;
    }
}
