<div class="table-responsive">
    <table class="table" id="farmCrops-table">
        <thead>
            <tr>
                <th>Crop Id</th>
        <th>Planting Date</th>
        <th>Area</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($farmCrops as $farmCrop)
            <tr>
                <td>{{ $farmCrop->crop_id }}</td>
            <td>{{ $farmCrop->planting_date }}</td>
            <td>{{ $farmCrop->area }}</td>
                <td>
                    {!! Form::open(['route' => ['farmCrops.destroy', $farmCrop->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('farmCrops.show', [$farmCrop->id]) }}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-eye-open"></i></a>
                        <a href="{{ route('farmCrops.edit', [$farmCrop->id]) }}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                        {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
