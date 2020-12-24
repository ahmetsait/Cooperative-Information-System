<div class="table-responsive">
    <table class="table" id="crops-table">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
        <th>Category</th>
        <th>Seed Unit Price</th>
        <th>Crop Standard Price</th>
        <th>Experience</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($crops as $crop)
            <tr>
                <td>{{ $crop->id }}</td>
                <td>{{ $crop->name }}</td>
            <td>{{ $crop->category }}</td>
            <td>{{ $crop->seed_unit_price }}</td>
            <td>{{ $crop->crop_standard_price }}</td>
            <td>{{ $crop->experience }}</td>
                <td>
                    {!! Form::open(['route' => ['crops.destroy', $crop->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('crops.show', [$crop->id]) }}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-eye-open"></i></a>
                        <a href="{{ route('crops.edit', [$crop->id]) }}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                        {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
