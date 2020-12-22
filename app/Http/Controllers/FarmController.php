<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateFarmRequest;
use App\Http\Requests\UpdateFarmRequest;
use App\Repositories\FarmRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
use Response;

class FarmController extends AppBaseController
{
    /** @var  FarmRepository */
    private $farmRepository;

    public function __construct(FarmRepository $farmRepo)
    {
        $this->farmRepository = $farmRepo;
    }

    /**
     * Display a listing of the Farm.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $farms = $this->farmRepository->all();

        return view('farms.index')
            ->with('farms', $farms);
    }

    /**
     * Show the form for creating a new Farm.
     *
     * @return Response
     */
    public function create()
    {
        return view('farms.create');
    }

    /**
     * Store a newly created Farm in storage.
     *
     * @param CreateFarmRequest $request
     *
     * @return Response
     * @throws \Exception
     */
    public function store(CreateFarmRequest $request)
    {
        $request->merge([
            'registration' => $this->convert_to_server_date($request->get('registration'))
        ]);

        $input = $request->all();

        $farm = $this->farmRepository->create($input);

        Flash::success('Farm saved successfully.');

        return redirect(route('farms.index'));
    }

    function convert_to_server_date($date, $format = 'n/j/Y g:i:s A', $userTimeZone = 'Europe/Istanbul', $serverTimeZone = 'UTC')
    {
        try {
            $dateTime = new \DateTime($date, new \DateTimeZone($userTimeZone));
            $dateTime->setTimezone(new \DateTimeZone($serverTimeZone));
            return $dateTime->format($format);
        } catch (\Exception $e) {
            return '';
        }
    }

    /**
     * Display the specified Farm.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $farm = $this->farmRepository->find($id);

        if (empty($farm)) {
            Flash::error('Farm not found');

            return redirect(route('farms.index'));
        }

        return view('farms.show')->with('farm', $farm);
    }

    /**
     * Show the form for editing the specified Farm.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $farm = $this->farmRepository->find($id);

        if (empty($farm)) {
            Flash::error('Farm not found');

            return redirect(route('farms.index'));
        }

        return view('farms.edit')->with('farm', $farm);
    }

    /**
     * Update the specified Farm in storage.
     *
     * @param int $id
     * @param UpdateFarmRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateFarmRequest $request)
    {
        $farm = $this->farmRepository->find($id);

        if (empty($farm)) {
            Flash::error('Farm not found');

            return redirect(route('farms.index'));
        }

        $farm = $this->farmRepository->update($request->all(), $id);

        Flash::success('Farm updated successfully.');

        return redirect(route('farms.index'));
    }

    /**
     * Remove the specified Farm from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $farm = $this->farmRepository->find($id);

        if (empty($farm)) {
            Flash::error('Farm not found');

            return redirect(route('farms.index'));
        }

        $this->farmRepository->delete($id);

        Flash::success('Farm deleted successfully.');

        return redirect(route('farms.index'));
    }
}
