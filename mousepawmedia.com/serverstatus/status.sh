#!/bin/bash

if [[ -z $1 ]]; then
    echo "No argument provided. See -h for help."
    exit 1
fi

while getopts ":hs:" opt; do
    case $opt in
        h)
            echo "Report status of the Hawksnest server."
            echo "status -s <status_id>"
            echo "   0: Normal"
            echo "   1: Maintainence"
            echo "   2: Weather"
            echo "   3: Error"
            ;;
        s)
            case $OPTARG in
                0)
                    echo "Reporting NORMAL status."
                    ln -sf serverstatus_normal.html serverstatus.html
                    ;;
                1)
                    echo "Reporting MAINTAINANCE status."
                    ln -sf serverstatus_maintain.html serverstatus.html
                    ;;
                2)
                    echo "Reporting WEATHER status."
                    ln -sf serverstatus_weather.html serverstatus.html
                    ;;
                3)
                    echo "Reporting ERROR status."
                    ln -sf serverstatus_error.html serverstatus.html
                    ;;
                *)
                    echo "Invalid status $OPTARG. See -h for help."
                    ;;
                esac
            ;;
        \?)
            echo "Invalid option -$OPTARG. See -h for help."
            exit 1
            ;;
        :)
            echo "Status (-s) requires an argument. See -h for help."
            exit 1
            ;;

    esac
done
