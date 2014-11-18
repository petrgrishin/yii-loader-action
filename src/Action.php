<?php
/**
 * @author Petr Grishin <petr.grishin@grishini.ru>
 */

namespace PetrGrishin\LoaderAction;


class Action {
    /** @var string */
    protected $url;
    protected $confirm;

    public static function className() {
        return get_called_class();
    }

    public static function create() {
        return new self();
    }

    public function __construct() {

    }

    /**
     * @return string
     */
    public function getUrl() {
        return $this->url;
    }

    /**
     * @param string $url
     * @return $this
     */
    public function setUrl($url) {
        $this->url = $url;
        return $this;
    }

    public function toArray() {
        return array(
            'url' => $this->url instanceof \PetrGrishin\Url\UrlBuilder ? $this->url->getUrl() : $this->url,
            'confirm' => $this->confirm,
        );
    }
}
 