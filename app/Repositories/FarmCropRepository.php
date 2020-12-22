<?php

namespace App\Repositories;

use App\Models\FarmCrop;
use App\Repositories\BaseRepository;

/**
 * Class FarmCropRepository
 * @package App\Repositories
 * @version December 22, 2020, 5:54 pm UTC
*/

class FarmCropRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'crop_id',
        'planting_date',
        'area'
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
        return FarmCrop::class;
    }
}
