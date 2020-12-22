<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateFarmerRequest;
use App\Http\Requests\UpdateFarmerRequest;
use App\Repositories\FarmerRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
use Response;

class FarmerController extends AppBaseController
{
    /** @var  FarmerRepository */
    private $farmerRepository;

    public function __construct(FarmerRepository $farmerRepo)
    {
        $this->farmerRepository = $farmerRepo;
    }

    /**
     * Display a listing of the Farmer.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $farmers = $this->farmerRepository->all();

        return view('farmers.index')
            ->with('farmers', $farmers);
    }

    /**
     * Show the form for creating a new Farmer.
     *
     * @return Response
     */
    public function create()
    {
        return view('farmers.create');
    }

    /**
     * Store a newly created Farmer in storage.
     *
     * @param CreateFarmerRequest $request
     *
     * @return Response
     */
    public function store(CreateFarmerRequest $request)
    {
        $input = $request->all();

        $farmer = $this->farmerRepository->create($input);

        Flash::success('Farmer saved successfully.');

        return redirect(route('farmers.index'));
    }

    /**
     * Display the specified Farmer.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $farmer = $this->farmerRepository->find($id);

        if (empty($farmer)) {
            Flash::error('Farmer not found');

            return redirect(route('farmers.index'));
        }

        return view('farmers.show')->with('farmer', $farmer);
    }

    /**
     * Show the form for editing the specified Farmer.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $farmer = $this->farmerRepository->find($id);

        if (empty($farmer)) {
            Flash::error('Farmer not found');

            return redirect(route('farmers.index'));
        }

        return view('farmers.edit')->with('farmer', $farmer);
    }

    /**
     * Update the specified Farmer in storage.
     *
     * @param int $id
     * @param UpdateFarmerRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateFarmerRequest $request)
    {
        $farmer = $this->farmerRepository->find($id);

        if (empty($farmer)) {
            Flash::error('Farmer not found');

            return redirect(route('farmers.index'));
        }

        $farmer = $this->farmerRepository->update($request->all(), $id);

        Flash::success('Farmer updated successfully.');

        return redirect(route('farmers.index'));
    }

    /**
     * Remove the specified Farmer from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $farmer = $this->farmerRepository->find($id);

        if (empty($farmer)) {
            Flash::error('Farmer not found');

            return redirect(route('farmers.index'));
        }

        $this->farmerRepository->delete($id);

        Flash::success('Farmer deleted successfully.');

        return redirect(route('farmers.index'));
    }
}
