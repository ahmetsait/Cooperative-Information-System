<div class="table-responsive">
    <table class="table" id="cooperativeMembers-table">
        <thead>
            <tr>
                <th>Cooperative Id</th>
                <th>Member Id</th>
        <th>Registration</th>
                <th colspan="3">Action</th>
            </tr>
        </thead>
        <tbody>
        @foreach($cooperativeMembers as $cooperativeMember)
            <tr>
                <td>{{ $cooperativeMember->Koop }}</td>
                <td>{{ $cooperativeMember->Farm }}</td>
            <td>{{ $cooperativeMember->registration }}</td>
                <td>
                    {!! Form::open(['route' => ['cooperativeMembers.destroy', $cooperativeMember->Koop], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('cooperativeMembers.show', [$cooperativeMember->Koop]) }}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-eye-open"></i></a>
                        <a href="{{ route('cooperativeMembers.edit', [$cooperativeMember->Koop]) }}" class='btn btn-default btn-xs'><i class="glyphicon glyphicon-edit"></i></a>
                        {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
