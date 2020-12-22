<div class="table-responsive">
    <table class="table" id="cooperatives-table">
        <thead>
            <tr>
                <th>Name</th>
        <th>Establishment Date</th>
        <th>Founder Id</th>
        <th>President Id</th>
        <th>City Code</th>
        <th>Address</th>
        <th>Email</th>
        <th>Member Count</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($cooperatives as $cooperative)
            <tr>
                <td>{{ $cooperative->name }}</td>
            <td>{{ $cooperative->establishment_date }}</td>
            <td>{{ $cooperative->founder_id }}</td>
            <td>{{ $cooperative->president_id }}</td>
            <td>{{ $cooperative->city_code }}</td>
            <td>{{ $cooperative->address }}</td>
            <td>{{ $cooperative->email }}</td>
            <td>{{ $cooperative->member_count }}</td>
                <td>
                    {!! Form::open(['route' => ['cooperatives.destroy', $cooperative->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('cooperatives.show', [$cooperative->id]) }}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-eye-open"></i></a>
                        <a href="{{ route('cooperatives.edit', [$cooperative->id]) }}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                        {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
