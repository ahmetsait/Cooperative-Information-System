<div class="table-responsive">
    <table class="table" id="cities-table">
        @if(isset($result[0]))
        <thead>
        <tr>
            @foreach( $result[0] as  $header_key => $value )
                <th>{{ $header_key }}</th>
            @endforeach
            <th colspan="3">Action</th>
        </tr>
        </thead>
        <tbody>

        @foreach(($result) as $row)
            <tr>
                @foreach( $row as  $row_key => $row_value)
                    <td>{{ $row_value }}</td>
                @endforeach
                <td>
                    {!! Form::open(['route' => ['cities.destroy', $row->code], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('cities.show', [$row->code]) }}" class='btn btn-default btn-xs'><i
                                class="glyphicon glyphicon-eye-open"></i></a>
                        <a href="{{ route('cities.edit', [$row->code]) }}" class='btn btn-default btn-xs'><i
                                class="glyphicon glyphicon-edit"></i></a>
                        {!! Form::button('<i class="glyphicon glyphicon-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs', 'onclick' => "return confirm('Are you sure?')"]) !!}
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
        @endif
        @if(!isset($result[0]))
            <thead>
            <tr>
                Sorgu Sonucunda Deger Bulunamadi (Boş Sonuç Dizgesi Döndü)
            </tr>
            </thead>
        @endif
    </table>
</div>
