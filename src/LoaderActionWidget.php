<?php
/**
 * @author Petr Grishin <petr.grishin@grishini.ru>
 */

namespace PetrGrishin\LoaderAction;


use PetrGrishin\Widget\BaseWidget;

class LoaderActionWidget extends BaseWidget {
    public $url;

    public function run() {
        $this->render('loaderAction', array(
            'url' => $this->url
        ));
    }
}
