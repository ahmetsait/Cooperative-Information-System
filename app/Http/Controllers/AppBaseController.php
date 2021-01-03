<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use InfyOm\Generator\Utils\ResponseUtil;
use Response;
use Flash;


/**
 * @SWG\Swagger(
 *   basePath="/api/v1",
 *   @SWG\Info(
 *     title="Laravel Generator APIs",
 *     version="1.0.0",
 *   )
 * )
 * This class should be parent class for other API controllers
 * Class AppBaseController
 */
class AppBaseController extends Controller
{
    public function sendResponse($result, $message)
    {
        return Response::json(ResponseUtil::makeResponse($message, $result));
    }

    public function sendError($error, $code = 404)
    {
        return Response::json(ResponseUtil::makeError($error), $code);
    }

    public function sendSuccess($message)
    {
        return Response::json([
            'success' => true,
            'message' => $message
        ], 200);
    }


    public function query_view_generator($header, $from, $sql, $view = 'solutions.basequery',$image_name = null) {
        $query_result = DB::select($sql);

        Flash::success($sql . '<br><br>' . substr($from, strlen(base_path()) + 1));
        return view($view)
            ->with('header',$header)
            ->with('img_name',$image_name)
            ->with('result',$query_result);
    }

    public function query_info_flasher($from, $sql) {
        Flash::info($sql . '<br><br>' . substr($from, strlen(base_path()) + 1));
    }

}
