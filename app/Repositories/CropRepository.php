<?php

namespace App\Repositories;

use App\Models\Crop;
use App\Repositories\BaseRepository;

/**
 * Class CropRepository
 * @package App\Repositories
 * @version December 22, 2020, 5:53 pm UTC
*/

class CropRepository extends BaseRepository
{
    /**
     * @var array
     */
    protected $fieldSearchable = [
        'name',
        'category',
        'seed_unit_price',
        'crop_standard_price',
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
        return Crop::class;
    }
}
