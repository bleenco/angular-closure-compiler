import { Observable } from '../../Observable';
import { raceStatic } from '../../operator/race';
Observable.race = raceStatic;
