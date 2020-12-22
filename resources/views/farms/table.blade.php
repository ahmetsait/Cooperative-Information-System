<div class="table-responsive">
    <table class="table" id="farms-table">
        <thead>
            <tr>
                <th>Registration</th>
        <th>Owner Id</th>
        <th>City Code</th>
        <th>Latitude</th>
        <th>Longitude</th>
        <th>Area</th>
        <th>Soil Type</th>
        <th>Unit Worth</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($farms as $farm)
            <tr>
                <td>{{ $farm->registration }}</td>
            <td>{{ $farm->owner_id }}</td>
            <td>{{ $farm->city_code }}</td>
            <td>{{ $farm->latitude }}</td>
            <td>{{ $farm->longitude }}</td>
            <td>{{ $farm->area }}</td>
            <td>{{ $farm->soil_type }}</td>
            <td>{{ $farm->unit_worth }}</td>
                <td>
                    {!! Form::open(['route' => ['farms.destroy', $farm->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('farms.show', [$farm->id]) }}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-eye-open"></i></a>
                        <a href="{{ route('farms.edit', [$farm->id]) }}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                        {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
