<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateFarmCropRequest;
use App\Http\Requests\UpdateFarmCropRequest;
use App\Repositories\FarmCropRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
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
        $farmCrops = $this->farmCropRepository->all();

        return view('farm_crops.index')
            ->with('farmCrops', $farmCrops);
    }

    /**
     * Show the form for creating a new FarmCrop.
     *
     * @return Response
     */
    public function create()
    {
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

        $farmCrop = $this->farmCropRepository->create($input);

        Flash::success('Farm Crop saved successfully.');

        return redirect(route('farmCrops.index'));
    }

    /**
     * Display the specified FarmCrop.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $farmCrop = $this->farmCropRepository->find($id);

        if (empty($farmCrop)) {
            Flash::error('Farm Crop not found');

            return redirect(route('farmCrops.index'));
        }

        return view('farm_crops.show')->with('farmCrop', $farmCrop);
    }

    /**
     * Show the form for editing the specified FarmCrop.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $farmCrop = $this->farmCropRepository->find($id);

        if (empty($farmCrop)) {
            Flash::error('Farm Crop not found');

            return redirect(route('farmCrops.index'));
        }

        return view('farm_crops.edit')->with('farmCrop', $farmCrop);
    }

    /**
     * Update the specified FarmCrop in storage.
     *
     * @param int $id
     * @param UpdateFarmCropRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateFarmCropRequest $request)
    {
        $farmCrop = $this->farmCropRepository->find($id);

        if (empty($farmCrop)) {
            Flash::error('Farm Crop not found');

            return redirect(route('farmCrops.index'));
        }

        $farmCrop = $this->farmCropRepository->update($request->all(), $id);

        Flash::success('Farm Crop updated successfully.');

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
        $farmCrop = $this->farmCropRepository->find($id);

        if (empty($farmCrop)) {
            Flash::error('Farm Crop not found');

            return redirect(route('farmCrops.index'));
        }

        $this->farmCropRepository->delete($id);

        Flash::success('Farm Crop deleted successfully.');

        return redirect(route('farmCrops.index'));
    }
}
