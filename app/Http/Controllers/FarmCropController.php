<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateFarmCropRequest;
use App\Http\Requests\UpdateFarmCropRequest;
use App\Repositories\FarmCropRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
use Illuminate\Support\Facades\DB;
use Response;

class FarmCropController extends AppBaseController
{
    /** @var  FarmCropRepository */
    private $farmCropRepository;

    public function __construct(FarmCropRepository $farmCropRepo)
    {
        $this->farmCropRepository = $farmCropRepo;
    }

    /**
     * Display a listing of the FarmCrop.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $header = "Arsalara Ekilen Mahsüller";
        $sql = 'SELECT cr.name as "Ekilen Bitki Ismi",fc.* FROM farmcrop fc LEFT JOIN crops cr ON fc.crop_id=cr.id';
        return $this->query_view_generator($header,__FILE__,$sql,'farm_crops.index');
    }

    /**
     * Show the form for creating a new FarmCrop.
     *
     * @return Response
     */
    public function create()
    {
        $sql = 'INSERT INTO farmcrop (farm_id,crop_id,planting_date,area) VALUES (form.farm_id,form.crop_id,form.planting_date,form.area); ';
        $this->query_info_flasher(__FILE__,$sql);
        return view('farm_crops.create');
    }

    /**
     * Store a newly created FarmCrop in storage.
     *
     * @param CreateFarmCropRequest $request
     *
     * @return Response
     */
    public function store(CreateFarmCropRequest $request)
    {
        $input = $request->all();

        try {
            $farmCrop = $this->farmCropRepository->create($input);
            Flash::success('Farm Crop saved successfully.');
        } catch (\Exception $ex) {
            Flash::error('Veritabanında bulunmayan arsa veya mahsülü ekme işleminde bulunamazsınız.');
        }

        return redirect(route('farmCrops.index'));
    }

    /**
     * Remove the specified FarmCrop from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $farm_id = intval(explode('-',$id)[0]);
        $crop_id = explode('-',$id)[1];
        $sql = "SELECT * FROM farmcrop WHERE crop_id='" . ($crop_id) . "'  AND farm_id=" . $farm_id . " ;";
        $farmCrop = DB::select($sql);

        if (empty($farmCrop)) {
            Flash::error('Farm Crop not found');

            return redirect(route('farmCrops.index'));
        }

        $sql_delete = "DELETE FROM farmcrop WHERE crop_id='" . ($crop_id) . "'  AND farm_id=" . $farm_id . " ;";
        if (DB::statement($sql_delete)) {
            Flash::success('Cooperative Member deleted successfully.');
        } else {
            Flash::error('Cooperative Member Could Not Deleted');

        }

        Flash::success('Farm Crop deleted successfully.');

        return redirect(route('farmCrops.index'));
    }
}
