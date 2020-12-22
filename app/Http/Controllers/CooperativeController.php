<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateCooperativeRequest;
use App\Http\Requests\UpdateCooperativeRequest;
use App\Repositories\CooperativeRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
use Response;

class CooperativeController extends AppBaseController
{
    /** @var  CooperativeRepository */
    private $cooperativeRepository;

    public function __construct(CooperativeRepository $cooperativeRepo)
    {
        $this->cooperativeRepository = $cooperativeRepo;
    }

    /**
     * Display a listing of the Cooperative.
     *
     * @param Request $request
     *
     * @return Response
     */
    public function index(Request $request)
    {
        $cooperatives = $this->cooperativeRepository->all();

        return view('cooperatives.index')
            ->with('cooperatives', $cooperatives);
    }

    /**
     * Show the form for creating a new Cooperative.
     *
     * @return Response
     */
    public function create()
    {
        return view('cooperatives.create');
    }

    /**
     * Store a newly created Cooperative in storage.
     *
     * @param CreateCooperativeRequest $request
     *
     * @return Response
     */
    public function store(CreateCooperativeRequest $request)
    {
        $input = $request->all();

        $cooperative = $this->cooperativeRepository->create($input);

        Flash::success('Cooperative saved successfully.');

        return redirect(route('cooperatives.index'));
    }

    /**
     * Display the specified Cooperative.
     *
     * @param int $id
     *
     * @return Response
     */
    public function show($id)
    {
        $cooperative = $this->cooperativeRepository->find($id);

        if (empty($cooperative)) {
            Flash::error('Cooperative not found');

            return redirect(route('cooperatives.index'));
        }

        return view('cooperatives.show')->with('cooperative', $cooperative);
    }

    /**
     * Show the form for editing the specified Cooperative.
     *
     * @param int $id
     *
     * @return Response
     */
    public function edit($id)
    {
        $cooperative = $this->cooperativeRepository->find($id);

        if (empty($cooperative)) {
            Flash::error('Cooperative not found');

            return redirect(route('cooperatives.index'));
        }

        return view('cooperatives.edit')->with('cooperative', $cooperative);
    }

    /**
     * Update the specified Cooperative in storage.
     *
     * @param int $id
     * @param UpdateCooperativeRequest $request
     *
     * @return Response
     */
    public function update($id, UpdateCooperativeRequest $request)
    {
        $cooperative = $this->cooperativeRepository->find($id);

        if (empty($cooperative)) {
            Flash::error('Cooperative not found');

            return redirect(route('cooperatives.index'));
        }

        $cooperative = $this->cooperativeRepository->update($request->all(), $id);

        Flash::success('Cooperative updated successfully.');

        return redirect(route('cooperatives.index'));
    }

    /**
     * Remove the specified Cooperative from storage.
     *
     * @param int $id
     *
     * @throws \Exception
     *
     * @return Response
     */
    public function destroy($id)
    {
        $cooperative = $this->cooperativeRepository->find($id);

        if (empty($cooperative)) {
            Flash::error('Cooperative not found');

            return redirect(route('cooperatives.index'));
        }

        $this->cooperativeRepository->delete($id);

        Flash::success('Cooperative deleted successfully.');

        return redirect(route('cooperatives.index'));
    }
}
