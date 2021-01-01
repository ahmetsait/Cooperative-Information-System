<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateCooperativeRequest;
use App\Http\Requests\UpdateCooperativeRequest;
use App\Repositories\CooperativeRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Response;
use Flash;

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
        $header = "Sisteme Kayıtlı Kooperatifler";
        $sql = 'SELECT * FROM cooperatives ORDER BY member_count DESC';
        return $this->query_view_generator($header,__FILE__,$sql,'cooperatives.index');
    }

    /**
     * Show the form for creating a new Cooperative.
     *
     * @return Response
     */
    public function create()
    {
        $sql = 'INSERT INTO cooperatives (name,establishment_date,founder_id,president_id,city_code,address,email) VALUES (form.name,form.establishment_date,form.founder_id,form.president_id,form.city_code,form.address,form.email); ';
        $this->query_info_flasher(__FILE__,$sql);
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
        $request->merge([
            'establishment_date' => $this->convert_to_server_date($request->get('establishment_date'))
        ]);

        $input = $request->all();

        $cooperative = $this->cooperativeRepository->create($input);
        Flash::success('Cooperative saved successfully.');

        return redirect(route('cooperatives.index'));
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

        $sql = 'UPDATE cooperatives SET name = form.name,establishment_date = form.establishment_date,founder_id = form.founder_id,president_id = form.president_id ,city_code = form.city_code,address = form.address,email = form.email WHERE id=id; ';
        $this->query_info_flasher(__FILE__,$sql);

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
