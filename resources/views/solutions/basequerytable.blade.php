<div class="table-responsive">
    <table class="table" id="farmCrops-table">
        <thead>
        <tr>
        @foreach( $result[0] as  $header_key => $value )
                <th>{{ $header_key }}</th>
        @endforeach
        </tr>
        </thead>
        <tbody>

        @foreach(($result) as $row)
            <tr>
            @foreach( $row as  $row_key => $row_value)
                    <td>{{ $row_value }}</td>
            @endforeach
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
