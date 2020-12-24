<div class="table-responsive">
    <table class="table" id="farmers-table">
        <thead>
            <tr>
                <th>Tc Kimlik No</th>
                <th>Registration</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Birthday</th>
        <th>Phone</th>
        <th>Email</th>
        <th>Address</th>
        <th>Experience</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($farmers as $farmer)
            <tr>
                <td>{{ $farmer->id }}</td>
                <td>{{ $farmer->registration }}</td>
            <td>{{ $farmer->name }}</td>
            <td>{{ $farmer->surname }}</td>
            <td>{{ $farmer->birthday }}</td>
            <td>{{ $farmer->phone }}</td>
            <td>{{ $farmer->email }}</td>
            <td>{{ $farmer->address }}</td>
            <td>{{ $farmer->experience }}</td>
                <td>
                    {!! Form::open(['route' => ['farmers.destroy', $farmer->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('farmers.show', [$farmer->id]) }}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-eye-open"></i></a>
                        <a href="{{ route('farmers.edit', [$farmer->id]) }}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                        {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
