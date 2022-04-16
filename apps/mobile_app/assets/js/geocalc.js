(() => {
  var __create = Object.create;
  var __defProp = Object.defineProperty;
  var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
  var __getOwnPropNames = Object.getOwnPropertyNames;
  var __getProtoOf = Object.getPrototypeOf;
  var __hasOwnProp = Object.prototype.hasOwnProperty;
  var __commonJS = (cb, mod) => function __require() {
    return mod || (0, cb[__getOwnPropNames(cb)[0]])((mod = { exports: {} }).exports, mod), mod.exports;
  };
  var __copyProps = (to, from, except, desc) => {
    if (from && typeof from === "object" || typeof from === "function") {
      for (let key of __getOwnPropNames(from))
        if (!__hasOwnProp.call(to, key) && key !== except)
          __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
    }
    return to;
  };
  var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target, mod));

  // node_modules/geojson-rbush/node_modules/rbush/rbush.min.js
  var require_rbush_min = __commonJS({
    "node_modules/geojson-rbush/node_modules/rbush/rbush.min.js"(exports, module) {
      !function(t, i) {
        typeof exports == "object" && typeof module != "undefined" ? module.exports = i() : typeof define == "function" && define.amd ? define(i) : (t = t || self).RBush = i();
      }(exports, function() {
        "use strict";
        function t(t2, r2, e2, a2, h2) {
          !function t3(n2, r3, e3, a3, h3) {
            for (; a3 > e3; ) {
              if (a3 - e3 > 600) {
                var o2 = a3 - e3 + 1, s2 = r3 - e3 + 1, l2 = Math.log(o2), f2 = 0.5 * Math.exp(2 * l2 / 3), u2 = 0.5 * Math.sqrt(l2 * f2 * (o2 - f2) / o2) * (s2 - o2 / 2 < 0 ? -1 : 1), m2 = Math.max(e3, Math.floor(r3 - s2 * f2 / o2 + u2)), c2 = Math.min(a3, Math.floor(r3 + (o2 - s2) * f2 / o2 + u2));
                t3(n2, r3, m2, c2, h3);
              }
              var p2 = n2[r3], d2 = e3, x = a3;
              for (i(n2, e3, r3), h3(n2[a3], p2) > 0 && i(n2, e3, a3); d2 < x; ) {
                for (i(n2, d2, x), d2++, x--; h3(n2[d2], p2) < 0; )
                  d2++;
                for (; h3(n2[x], p2) > 0; )
                  x--;
              }
              h3(n2[e3], p2) === 0 ? i(n2, e3, x) : i(n2, ++x, a3), x <= r3 && (e3 = x + 1), r3 <= x && (a3 = x - 1);
            }
          }(t2, r2, e2 || 0, a2 || t2.length - 1, h2 || n);
        }
        function i(t2, i2, n2) {
          var r2 = t2[i2];
          t2[i2] = t2[n2], t2[n2] = r2;
        }
        function n(t2, i2) {
          return t2 < i2 ? -1 : t2 > i2 ? 1 : 0;
        }
        var r = function(t2) {
          t2 === void 0 && (t2 = 9), this._maxEntries = Math.max(4, t2), this._minEntries = Math.max(2, Math.ceil(0.4 * this._maxEntries)), this.clear();
        };
        function e(t2, i2, n2) {
          if (!n2)
            return i2.indexOf(t2);
          for (var r2 = 0; r2 < i2.length; r2++)
            if (n2(t2, i2[r2]))
              return r2;
          return -1;
        }
        function a(t2, i2) {
          h(t2, 0, t2.children.length, i2, t2);
        }
        function h(t2, i2, n2, r2, e2) {
          e2 || (e2 = p(null)), e2.minX = 1 / 0, e2.minY = 1 / 0, e2.maxX = -1 / 0, e2.maxY = -1 / 0;
          for (var a2 = i2; a2 < n2; a2++) {
            var h2 = t2.children[a2];
            o(e2, t2.leaf ? r2(h2) : h2);
          }
          return e2;
        }
        function o(t2, i2) {
          return t2.minX = Math.min(t2.minX, i2.minX), t2.minY = Math.min(t2.minY, i2.minY), t2.maxX = Math.max(t2.maxX, i2.maxX), t2.maxY = Math.max(t2.maxY, i2.maxY), t2;
        }
        function s(t2, i2) {
          return t2.minX - i2.minX;
        }
        function l(t2, i2) {
          return t2.minY - i2.minY;
        }
        function f(t2) {
          return (t2.maxX - t2.minX) * (t2.maxY - t2.minY);
        }
        function u(t2) {
          return t2.maxX - t2.minX + (t2.maxY - t2.minY);
        }
        function m(t2, i2) {
          return t2.minX <= i2.minX && t2.minY <= i2.minY && i2.maxX <= t2.maxX && i2.maxY <= t2.maxY;
        }
        function c(t2, i2) {
          return i2.minX <= t2.maxX && i2.minY <= t2.maxY && i2.maxX >= t2.minX && i2.maxY >= t2.minY;
        }
        function p(t2) {
          return { children: t2, height: 1, leaf: true, minX: 1 / 0, minY: 1 / 0, maxX: -1 / 0, maxY: -1 / 0 };
        }
        function d(i2, n2, r2, e2, a2) {
          for (var h2 = [n2, r2]; h2.length; )
            if (!((r2 = h2.pop()) - (n2 = h2.pop()) <= e2)) {
              var o2 = n2 + Math.ceil((r2 - n2) / e2 / 2) * e2;
              t(i2, o2, n2, r2, a2), h2.push(n2, o2, o2, r2);
            }
        }
        return r.prototype.all = function() {
          return this._all(this.data, []);
        }, r.prototype.search = function(t2) {
          var i2 = this.data, n2 = [];
          if (!c(t2, i2))
            return n2;
          for (var r2 = this.toBBox, e2 = []; i2; ) {
            for (var a2 = 0; a2 < i2.children.length; a2++) {
              var h2 = i2.children[a2], o2 = i2.leaf ? r2(h2) : h2;
              c(t2, o2) && (i2.leaf ? n2.push(h2) : m(t2, o2) ? this._all(h2, n2) : e2.push(h2));
            }
            i2 = e2.pop();
          }
          return n2;
        }, r.prototype.collides = function(t2) {
          var i2 = this.data;
          if (!c(t2, i2))
            return false;
          for (var n2 = []; i2; ) {
            for (var r2 = 0; r2 < i2.children.length; r2++) {
              var e2 = i2.children[r2], a2 = i2.leaf ? this.toBBox(e2) : e2;
              if (c(t2, a2)) {
                if (i2.leaf || m(t2, a2))
                  return true;
                n2.push(e2);
              }
            }
            i2 = n2.pop();
          }
          return false;
        }, r.prototype.load = function(t2) {
          if (!t2 || !t2.length)
            return this;
          if (t2.length < this._minEntries) {
            for (var i2 = 0; i2 < t2.length; i2++)
              this.insert(t2[i2]);
            return this;
          }
          var n2 = this._build(t2.slice(), 0, t2.length - 1, 0);
          if (this.data.children.length)
            if (this.data.height === n2.height)
              this._splitRoot(this.data, n2);
            else {
              if (this.data.height < n2.height) {
                var r2 = this.data;
                this.data = n2, n2 = r2;
              }
              this._insert(n2, this.data.height - n2.height - 1, true);
            }
          else
            this.data = n2;
          return this;
        }, r.prototype.insert = function(t2) {
          return t2 && this._insert(t2, this.data.height - 1), this;
        }, r.prototype.clear = function() {
          return this.data = p([]), this;
        }, r.prototype.remove = function(t2, i2) {
          if (!t2)
            return this;
          for (var n2, r2, a2, h2 = this.data, o2 = this.toBBox(t2), s2 = [], l2 = []; h2 || s2.length; ) {
            if (h2 || (h2 = s2.pop(), r2 = s2[s2.length - 1], n2 = l2.pop(), a2 = true), h2.leaf) {
              var f2 = e(t2, h2.children, i2);
              if (f2 !== -1)
                return h2.children.splice(f2, 1), s2.push(h2), this._condense(s2), this;
            }
            a2 || h2.leaf || !m(h2, o2) ? r2 ? (n2++, h2 = r2.children[n2], a2 = false) : h2 = null : (s2.push(h2), l2.push(n2), n2 = 0, r2 = h2, h2 = h2.children[0]);
          }
          return this;
        }, r.prototype.toBBox = function(t2) {
          return t2;
        }, r.prototype.compareMinX = function(t2, i2) {
          return t2.minX - i2.minX;
        }, r.prototype.compareMinY = function(t2, i2) {
          return t2.minY - i2.minY;
        }, r.prototype.toJSON = function() {
          return this.data;
        }, r.prototype.fromJSON = function(t2) {
          return this.data = t2, this;
        }, r.prototype._all = function(t2, i2) {
          for (var n2 = []; t2; )
            t2.leaf ? i2.push.apply(i2, t2.children) : n2.push.apply(n2, t2.children), t2 = n2.pop();
          return i2;
        }, r.prototype._build = function(t2, i2, n2, r2) {
          var e2, h2 = n2 - i2 + 1, o2 = this._maxEntries;
          if (h2 <= o2)
            return a(e2 = p(t2.slice(i2, n2 + 1)), this.toBBox), e2;
          r2 || (r2 = Math.ceil(Math.log(h2) / Math.log(o2)), o2 = Math.ceil(h2 / Math.pow(o2, r2 - 1))), (e2 = p([])).leaf = false, e2.height = r2;
          var s2 = Math.ceil(h2 / o2), l2 = s2 * Math.ceil(Math.sqrt(o2));
          d(t2, i2, n2, l2, this.compareMinX);
          for (var f2 = i2; f2 <= n2; f2 += l2) {
            var u2 = Math.min(f2 + l2 - 1, n2);
            d(t2, f2, u2, s2, this.compareMinY);
            for (var m2 = f2; m2 <= u2; m2 += s2) {
              var c2 = Math.min(m2 + s2 - 1, u2);
              e2.children.push(this._build(t2, m2, c2, r2 - 1));
            }
          }
          return a(e2, this.toBBox), e2;
        }, r.prototype._chooseSubtree = function(t2, i2, n2, r2) {
          for (; r2.push(i2), !i2.leaf && r2.length - 1 !== n2; ) {
            for (var e2 = 1 / 0, a2 = 1 / 0, h2 = void 0, o2 = 0; o2 < i2.children.length; o2++) {
              var s2 = i2.children[o2], l2 = f(s2), u2 = (m2 = t2, c2 = s2, (Math.max(c2.maxX, m2.maxX) - Math.min(c2.minX, m2.minX)) * (Math.max(c2.maxY, m2.maxY) - Math.min(c2.minY, m2.minY)) - l2);
              u2 < a2 ? (a2 = u2, e2 = l2 < e2 ? l2 : e2, h2 = s2) : u2 === a2 && l2 < e2 && (e2 = l2, h2 = s2);
            }
            i2 = h2 || i2.children[0];
          }
          var m2, c2;
          return i2;
        }, r.prototype._insert = function(t2, i2, n2) {
          var r2 = n2 ? t2 : this.toBBox(t2), e2 = [], a2 = this._chooseSubtree(r2, this.data, i2, e2);
          for (a2.children.push(t2), o(a2, r2); i2 >= 0 && e2[i2].children.length > this._maxEntries; )
            this._split(e2, i2), i2--;
          this._adjustParentBBoxes(r2, e2, i2);
        }, r.prototype._split = function(t2, i2) {
          var n2 = t2[i2], r2 = n2.children.length, e2 = this._minEntries;
          this._chooseSplitAxis(n2, e2, r2);
          var h2 = this._chooseSplitIndex(n2, e2, r2), o2 = p(n2.children.splice(h2, n2.children.length - h2));
          o2.height = n2.height, o2.leaf = n2.leaf, a(n2, this.toBBox), a(o2, this.toBBox), i2 ? t2[i2 - 1].children.push(o2) : this._splitRoot(n2, o2);
        }, r.prototype._splitRoot = function(t2, i2) {
          this.data = p([t2, i2]), this.data.height = t2.height + 1, this.data.leaf = false, a(this.data, this.toBBox);
        }, r.prototype._chooseSplitIndex = function(t2, i2, n2) {
          for (var r2, e2, a2, o2, s2, l2, u2, m2 = 1 / 0, c2 = 1 / 0, p2 = i2; p2 <= n2 - i2; p2++) {
            var d2 = h(t2, 0, p2, this.toBBox), x = h(t2, p2, n2, this.toBBox), v = (e2 = d2, a2 = x, o2 = void 0, s2 = void 0, l2 = void 0, u2 = void 0, o2 = Math.max(e2.minX, a2.minX), s2 = Math.max(e2.minY, a2.minY), l2 = Math.min(e2.maxX, a2.maxX), u2 = Math.min(e2.maxY, a2.maxY), Math.max(0, l2 - o2) * Math.max(0, u2 - s2)), M = f(d2) + f(x);
            v < m2 ? (m2 = v, r2 = p2, c2 = M < c2 ? M : c2) : v === m2 && M < c2 && (c2 = M, r2 = p2);
          }
          return r2 || n2 - i2;
        }, r.prototype._chooseSplitAxis = function(t2, i2, n2) {
          var r2 = t2.leaf ? this.compareMinX : s, e2 = t2.leaf ? this.compareMinY : l;
          this._allDistMargin(t2, i2, n2, r2) < this._allDistMargin(t2, i2, n2, e2) && t2.children.sort(r2);
        }, r.prototype._allDistMargin = function(t2, i2, n2, r2) {
          t2.children.sort(r2);
          for (var e2 = this.toBBox, a2 = h(t2, 0, i2, e2), s2 = h(t2, n2 - i2, n2, e2), l2 = u(a2) + u(s2), f2 = i2; f2 < n2 - i2; f2++) {
            var m2 = t2.children[f2];
            o(a2, t2.leaf ? e2(m2) : m2), l2 += u(a2);
          }
          for (var c2 = n2 - i2 - 1; c2 >= i2; c2--) {
            var p2 = t2.children[c2];
            o(s2, t2.leaf ? e2(p2) : p2), l2 += u(s2);
          }
          return l2;
        }, r.prototype._adjustParentBBoxes = function(t2, i2, n2) {
          for (var r2 = n2; r2 >= 0; r2--)
            o(i2[r2], t2);
        }, r.prototype._condense = function(t2) {
          for (var i2 = t2.length - 1, n2 = void 0; i2 >= 0; i2--)
            t2[i2].children.length === 0 ? i2 > 0 ? (n2 = t2[i2 - 1].children).splice(n2.indexOf(t2[i2]), 1) : this.clear() : a(t2[i2], this.toBBox);
        }, r;
      });
    }
  });

  // node_modules/@turf/helpers/dist/js/index.js
  var require_js = __commonJS({
    "node_modules/@turf/helpers/dist/js/index.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.earthRadius = 63710088e-1;
      exports.factors = {
        centimeters: exports.earthRadius * 100,
        centimetres: exports.earthRadius * 100,
        degrees: exports.earthRadius / 111325,
        feet: exports.earthRadius * 3.28084,
        inches: exports.earthRadius * 39.37,
        kilometers: exports.earthRadius / 1e3,
        kilometres: exports.earthRadius / 1e3,
        meters: exports.earthRadius,
        metres: exports.earthRadius,
        miles: exports.earthRadius / 1609.344,
        millimeters: exports.earthRadius * 1e3,
        millimetres: exports.earthRadius * 1e3,
        nauticalmiles: exports.earthRadius / 1852,
        radians: 1,
        yards: exports.earthRadius * 1.0936
      };
      exports.unitsFactors = {
        centimeters: 100,
        centimetres: 100,
        degrees: 1 / 111325,
        feet: 3.28084,
        inches: 39.37,
        kilometers: 1 / 1e3,
        kilometres: 1 / 1e3,
        meters: 1,
        metres: 1,
        miles: 1 / 1609.344,
        millimeters: 1e3,
        millimetres: 1e3,
        nauticalmiles: 1 / 1852,
        radians: 1 / exports.earthRadius,
        yards: 1.0936133
      };
      exports.areaFactors = {
        acres: 247105e-9,
        centimeters: 1e4,
        centimetres: 1e4,
        feet: 10.763910417,
        hectares: 1e-4,
        inches: 1550.003100006,
        kilometers: 1e-6,
        kilometres: 1e-6,
        meters: 1,
        metres: 1,
        miles: 386e-9,
        millimeters: 1e6,
        millimetres: 1e6,
        yards: 1.195990046
      };
      function feature2(geom, properties, options) {
        if (options === void 0) {
          options = {};
        }
        var feat = { type: "Feature" };
        if (options.id === 0 || options.id) {
          feat.id = options.id;
        }
        if (options.bbox) {
          feat.bbox = options.bbox;
        }
        feat.properties = properties || {};
        feat.geometry = geom;
        return feat;
      }
      exports.feature = feature2;
      function geometry(type, coordinates, _options) {
        if (_options === void 0) {
          _options = {};
        }
        switch (type) {
          case "Point":
            return point2(coordinates).geometry;
          case "LineString":
            return lineString2(coordinates).geometry;
          case "Polygon":
            return polygon(coordinates).geometry;
          case "MultiPoint":
            return multiPoint(coordinates).geometry;
          case "MultiLineString":
            return multiLineString(coordinates).geometry;
          case "MultiPolygon":
            return multiPolygon(coordinates).geometry;
          default:
            throw new Error(type + " is invalid");
        }
      }
      exports.geometry = geometry;
      function point2(coordinates, properties, options) {
        if (options === void 0) {
          options = {};
        }
        if (!coordinates) {
          throw new Error("coordinates is required");
        }
        if (!Array.isArray(coordinates)) {
          throw new Error("coordinates must be an Array");
        }
        if (coordinates.length < 2) {
          throw new Error("coordinates must be at least 2 numbers long");
        }
        if (!isNumber2(coordinates[0]) || !isNumber2(coordinates[1])) {
          throw new Error("coordinates must contain numbers");
        }
        var geom = {
          type: "Point",
          coordinates
        };
        return feature2(geom, properties, options);
      }
      exports.point = point2;
      function points(coordinates, properties, options) {
        if (options === void 0) {
          options = {};
        }
        return featureCollection2(coordinates.map(function(coords) {
          return point2(coords, properties);
        }), options);
      }
      exports.points = points;
      function polygon(coordinates, properties, options) {
        if (options === void 0) {
          options = {};
        }
        for (var _i = 0, coordinates_1 = coordinates; _i < coordinates_1.length; _i++) {
          var ring = coordinates_1[_i];
          if (ring.length < 4) {
            throw new Error("Each LinearRing of a Polygon must have 4 or more Positions.");
          }
          for (var j = 0; j < ring[ring.length - 1].length; j++) {
            if (ring[ring.length - 1][j] !== ring[0][j]) {
              throw new Error("First and last Position are not equivalent.");
            }
          }
        }
        var geom = {
          type: "Polygon",
          coordinates
        };
        return feature2(geom, properties, options);
      }
      exports.polygon = polygon;
      function polygons(coordinates, properties, options) {
        if (options === void 0) {
          options = {};
        }
        return featureCollection2(coordinates.map(function(coords) {
          return polygon(coords, properties);
        }), options);
      }
      exports.polygons = polygons;
      function lineString2(coordinates, properties, options) {
        if (options === void 0) {
          options = {};
        }
        if (coordinates.length < 2) {
          throw new Error("coordinates must be an array of two or more positions");
        }
        var geom = {
          type: "LineString",
          coordinates
        };
        return feature2(geom, properties, options);
      }
      exports.lineString = lineString2;
      function lineStrings(coordinates, properties, options) {
        if (options === void 0) {
          options = {};
        }
        return featureCollection2(coordinates.map(function(coords) {
          return lineString2(coords, properties);
        }), options);
      }
      exports.lineStrings = lineStrings;
      function featureCollection2(features, options) {
        if (options === void 0) {
          options = {};
        }
        var fc = { type: "FeatureCollection" };
        if (options.id) {
          fc.id = options.id;
        }
        if (options.bbox) {
          fc.bbox = options.bbox;
        }
        fc.features = features;
        return fc;
      }
      exports.featureCollection = featureCollection2;
      function multiLineString(coordinates, properties, options) {
        if (options === void 0) {
          options = {};
        }
        var geom = {
          type: "MultiLineString",
          coordinates
        };
        return feature2(geom, properties, options);
      }
      exports.multiLineString = multiLineString;
      function multiPoint(coordinates, properties, options) {
        if (options === void 0) {
          options = {};
        }
        var geom = {
          type: "MultiPoint",
          coordinates
        };
        return feature2(geom, properties, options);
      }
      exports.multiPoint = multiPoint;
      function multiPolygon(coordinates, properties, options) {
        if (options === void 0) {
          options = {};
        }
        var geom = {
          type: "MultiPolygon",
          coordinates
        };
        return feature2(geom, properties, options);
      }
      exports.multiPolygon = multiPolygon;
      function geometryCollection(geometries, properties, options) {
        if (options === void 0) {
          options = {};
        }
        var geom = {
          type: "GeometryCollection",
          geometries
        };
        return feature2(geom, properties, options);
      }
      exports.geometryCollection = geometryCollection;
      function round(num, precision) {
        if (precision === void 0) {
          precision = 0;
        }
        if (precision && !(precision >= 0)) {
          throw new Error("precision must be a positive number");
        }
        var multiplier = Math.pow(10, precision || 0);
        return Math.round(num * multiplier) / multiplier;
      }
      exports.round = round;
      function radiansToLength2(radians, units) {
        if (units === void 0) {
          units = "kilometers";
        }
        var factor = exports.factors[units];
        if (!factor) {
          throw new Error(units + " units is invalid");
        }
        return radians * factor;
      }
      exports.radiansToLength = radiansToLength2;
      function lengthToRadians2(distance2, units) {
        if (units === void 0) {
          units = "kilometers";
        }
        var factor = exports.factors[units];
        if (!factor) {
          throw new Error(units + " units is invalid");
        }
        return distance2 / factor;
      }
      exports.lengthToRadians = lengthToRadians2;
      function lengthToDegrees(distance2, units) {
        return radiansToDegrees2(lengthToRadians2(distance2, units));
      }
      exports.lengthToDegrees = lengthToDegrees;
      function bearingToAzimuth(bearing2) {
        var angle = bearing2 % 360;
        if (angle < 0) {
          angle += 360;
        }
        return angle;
      }
      exports.bearingToAzimuth = bearingToAzimuth;
      function radiansToDegrees2(radians) {
        var degrees = radians % (2 * Math.PI);
        return degrees * 180 / Math.PI;
      }
      exports.radiansToDegrees = radiansToDegrees2;
      function degreesToRadians2(degrees) {
        var radians = degrees % 360;
        return radians * Math.PI / 180;
      }
      exports.degreesToRadians = degreesToRadians2;
      function convertLength(length2, originalUnit, finalUnit) {
        if (originalUnit === void 0) {
          originalUnit = "kilometers";
        }
        if (finalUnit === void 0) {
          finalUnit = "kilometers";
        }
        if (!(length2 >= 0)) {
          throw new Error("length must be a positive number");
        }
        return radiansToLength2(lengthToRadians2(length2, originalUnit), finalUnit);
      }
      exports.convertLength = convertLength;
      function convertArea(area, originalUnit, finalUnit) {
        if (originalUnit === void 0) {
          originalUnit = "meters";
        }
        if (finalUnit === void 0) {
          finalUnit = "kilometers";
        }
        if (!(area >= 0)) {
          throw new Error("area must be a positive number");
        }
        var startFactor = exports.areaFactors[originalUnit];
        if (!startFactor) {
          throw new Error("invalid original units");
        }
        var finalFactor = exports.areaFactors[finalUnit];
        if (!finalFactor) {
          throw new Error("invalid final units");
        }
        return area / startFactor * finalFactor;
      }
      exports.convertArea = convertArea;
      function isNumber2(num) {
        return !isNaN(num) && num !== null && !Array.isArray(num);
      }
      exports.isNumber = isNumber2;
      function isObject2(input) {
        return !!input && input.constructor === Object;
      }
      exports.isObject = isObject2;
      function validateBBox(bbox2) {
        if (!bbox2) {
          throw new Error("bbox is required");
        }
        if (!Array.isArray(bbox2)) {
          throw new Error("bbox must be an Array");
        }
        if (bbox2.length !== 4 && bbox2.length !== 6) {
          throw new Error("bbox must be an Array of 4 or 6 numbers");
        }
        bbox2.forEach(function(num) {
          if (!isNumber2(num)) {
            throw new Error("bbox must only contain numbers");
          }
        });
      }
      exports.validateBBox = validateBBox;
      function validateId(id) {
        if (!id) {
          throw new Error("id is required");
        }
        if (["string", "number"].indexOf(typeof id) === -1) {
          throw new Error("id must be a number or a string");
        }
      }
      exports.validateId = validateId;
    }
  });

  // node_modules/@turf/meta/dist/js/index.js
  var require_js2 = __commonJS({
    "node_modules/@turf/meta/dist/js/index.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      var helpers = require_js();
      function coordEach2(geojson, callback, excludeWrapCoord) {
        if (geojson === null)
          return;
        var j, k, l, geometry, stopG, coords, geometryMaybeCollection, wrapShrink = 0, coordIndex = 0, isGeometryCollection, type = geojson.type, isFeatureCollection = type === "FeatureCollection", isFeature = type === "Feature", stop = isFeatureCollection ? geojson.features.length : 1;
        for (var featureIndex = 0; featureIndex < stop; featureIndex++) {
          geometryMaybeCollection = isFeatureCollection ? geojson.features[featureIndex].geometry : isFeature ? geojson.geometry : geojson;
          isGeometryCollection = geometryMaybeCollection ? geometryMaybeCollection.type === "GeometryCollection" : false;
          stopG = isGeometryCollection ? geometryMaybeCollection.geometries.length : 1;
          for (var geomIndex = 0; geomIndex < stopG; geomIndex++) {
            var multiFeatureIndex = 0;
            var geometryIndex = 0;
            geometry = isGeometryCollection ? geometryMaybeCollection.geometries[geomIndex] : geometryMaybeCollection;
            if (geometry === null)
              continue;
            coords = geometry.coordinates;
            var geomType = geometry.type;
            wrapShrink = excludeWrapCoord && (geomType === "Polygon" || geomType === "MultiPolygon") ? 1 : 0;
            switch (geomType) {
              case null:
                break;
              case "Point":
                if (callback(coords, coordIndex, featureIndex, multiFeatureIndex, geometryIndex) === false)
                  return false;
                coordIndex++;
                multiFeatureIndex++;
                break;
              case "LineString":
              case "MultiPoint":
                for (j = 0; j < coords.length; j++) {
                  if (callback(coords[j], coordIndex, featureIndex, multiFeatureIndex, geometryIndex) === false)
                    return false;
                  coordIndex++;
                  if (geomType === "MultiPoint")
                    multiFeatureIndex++;
                }
                if (geomType === "LineString")
                  multiFeatureIndex++;
                break;
              case "Polygon":
              case "MultiLineString":
                for (j = 0; j < coords.length; j++) {
                  for (k = 0; k < coords[j].length - wrapShrink; k++) {
                    if (callback(coords[j][k], coordIndex, featureIndex, multiFeatureIndex, geometryIndex) === false)
                      return false;
                    coordIndex++;
                  }
                  if (geomType === "MultiLineString")
                    multiFeatureIndex++;
                  if (geomType === "Polygon")
                    geometryIndex++;
                }
                if (geomType === "Polygon")
                  multiFeatureIndex++;
                break;
              case "MultiPolygon":
                for (j = 0; j < coords.length; j++) {
                  geometryIndex = 0;
                  for (k = 0; k < coords[j].length; k++) {
                    for (l = 0; l < coords[j][k].length - wrapShrink; l++) {
                      if (callback(coords[j][k][l], coordIndex, featureIndex, multiFeatureIndex, geometryIndex) === false)
                        return false;
                      coordIndex++;
                    }
                    geometryIndex++;
                  }
                  multiFeatureIndex++;
                }
                break;
              case "GeometryCollection":
                for (j = 0; j < geometry.geometries.length; j++)
                  if (coordEach2(geometry.geometries[j], callback, excludeWrapCoord) === false)
                    return false;
                break;
              default:
                throw new Error("Unknown Geometry Type");
            }
          }
        }
      }
      function coordReduce(geojson, callback, initialValue, excludeWrapCoord) {
        var previousValue = initialValue;
        coordEach2(geojson, function(currentCoord, coordIndex, featureIndex, multiFeatureIndex, geometryIndex) {
          if (coordIndex === 0 && initialValue === void 0)
            previousValue = currentCoord;
          else
            previousValue = callback(previousValue, currentCoord, coordIndex, featureIndex, multiFeatureIndex, geometryIndex);
        }, excludeWrapCoord);
        return previousValue;
      }
      function propEach(geojson, callback) {
        var i;
        switch (geojson.type) {
          case "FeatureCollection":
            for (i = 0; i < geojson.features.length; i++) {
              if (callback(geojson.features[i].properties, i) === false)
                break;
            }
            break;
          case "Feature":
            callback(geojson.properties, 0);
            break;
        }
      }
      function propReduce(geojson, callback, initialValue) {
        var previousValue = initialValue;
        propEach(geojson, function(currentProperties, featureIndex) {
          if (featureIndex === 0 && initialValue === void 0)
            previousValue = currentProperties;
          else
            previousValue = callback(previousValue, currentProperties, featureIndex);
        });
        return previousValue;
      }
      function featureEach2(geojson, callback) {
        if (geojson.type === "Feature") {
          callback(geojson, 0);
        } else if (geojson.type === "FeatureCollection") {
          for (var i = 0; i < geojson.features.length; i++) {
            if (callback(geojson.features[i], i) === false)
              break;
          }
        }
      }
      function featureReduce(geojson, callback, initialValue) {
        var previousValue = initialValue;
        featureEach2(geojson, function(currentFeature, featureIndex) {
          if (featureIndex === 0 && initialValue === void 0)
            previousValue = currentFeature;
          else
            previousValue = callback(previousValue, currentFeature, featureIndex);
        });
        return previousValue;
      }
      function coordAll(geojson) {
        var coords = [];
        coordEach2(geojson, function(coord) {
          coords.push(coord);
        });
        return coords;
      }
      function geomEach2(geojson, callback) {
        var i, j, g, geometry, stopG, geometryMaybeCollection, isGeometryCollection, featureProperties, featureBBox, featureId, featureIndex = 0, isFeatureCollection = geojson.type === "FeatureCollection", isFeature = geojson.type === "Feature", stop = isFeatureCollection ? geojson.features.length : 1;
        for (i = 0; i < stop; i++) {
          geometryMaybeCollection = isFeatureCollection ? geojson.features[i].geometry : isFeature ? geojson.geometry : geojson;
          featureProperties = isFeatureCollection ? geojson.features[i].properties : isFeature ? geojson.properties : {};
          featureBBox = isFeatureCollection ? geojson.features[i].bbox : isFeature ? geojson.bbox : void 0;
          featureId = isFeatureCollection ? geojson.features[i].id : isFeature ? geojson.id : void 0;
          isGeometryCollection = geometryMaybeCollection ? geometryMaybeCollection.type === "GeometryCollection" : false;
          stopG = isGeometryCollection ? geometryMaybeCollection.geometries.length : 1;
          for (g = 0; g < stopG; g++) {
            geometry = isGeometryCollection ? geometryMaybeCollection.geometries[g] : geometryMaybeCollection;
            if (geometry === null) {
              if (callback(null, featureIndex, featureProperties, featureBBox, featureId) === false)
                return false;
              continue;
            }
            switch (geometry.type) {
              case "Point":
              case "LineString":
              case "MultiPoint":
              case "Polygon":
              case "MultiLineString":
              case "MultiPolygon": {
                if (callback(geometry, featureIndex, featureProperties, featureBBox, featureId) === false)
                  return false;
                break;
              }
              case "GeometryCollection": {
                for (j = 0; j < geometry.geometries.length; j++) {
                  if (callback(geometry.geometries[j], featureIndex, featureProperties, featureBBox, featureId) === false)
                    return false;
                }
                break;
              }
              default:
                throw new Error("Unknown Geometry Type");
            }
          }
          featureIndex++;
        }
      }
      function geomReduce(geojson, callback, initialValue) {
        var previousValue = initialValue;
        geomEach2(geojson, function(currentGeometry, featureIndex, featureProperties, featureBBox, featureId) {
          if (featureIndex === 0 && initialValue === void 0)
            previousValue = currentGeometry;
          else
            previousValue = callback(previousValue, currentGeometry, featureIndex, featureProperties, featureBBox, featureId);
        });
        return previousValue;
      }
      function flattenEach2(geojson, callback) {
        geomEach2(geojson, function(geometry, featureIndex, properties, bbox2, id) {
          var type = geometry === null ? null : geometry.type;
          switch (type) {
            case null:
            case "Point":
            case "LineString":
            case "Polygon":
              if (callback(helpers.feature(geometry, properties, { bbox: bbox2, id }), featureIndex, 0) === false)
                return false;
              return;
          }
          var geomType;
          switch (type) {
            case "MultiPoint":
              geomType = "Point";
              break;
            case "MultiLineString":
              geomType = "LineString";
              break;
            case "MultiPolygon":
              geomType = "Polygon";
              break;
          }
          for (var multiFeatureIndex = 0; multiFeatureIndex < geometry.coordinates.length; multiFeatureIndex++) {
            var coordinate = geometry.coordinates[multiFeatureIndex];
            var geom = {
              type: geomType,
              coordinates: coordinate
            };
            if (callback(helpers.feature(geom, properties), featureIndex, multiFeatureIndex) === false)
              return false;
          }
        });
      }
      function flattenReduce(geojson, callback, initialValue) {
        var previousValue = initialValue;
        flattenEach2(geojson, function(currentFeature, featureIndex, multiFeatureIndex) {
          if (featureIndex === 0 && multiFeatureIndex === 0 && initialValue === void 0)
            previousValue = currentFeature;
          else
            previousValue = callback(previousValue, currentFeature, featureIndex, multiFeatureIndex);
        });
        return previousValue;
      }
      function segmentEach2(geojson, callback) {
        flattenEach2(geojson, function(feature2, featureIndex, multiFeatureIndex) {
          var segmentIndex = 0;
          if (!feature2.geometry)
            return;
          var type = feature2.geometry.type;
          if (type === "Point" || type === "MultiPoint")
            return;
          var previousCoords;
          var previousFeatureIndex = 0;
          var previousMultiIndex = 0;
          var prevGeomIndex = 0;
          if (coordEach2(feature2, function(currentCoord, coordIndex, featureIndexCoord, multiPartIndexCoord, geometryIndex) {
            if (previousCoords === void 0 || featureIndex > previousFeatureIndex || multiPartIndexCoord > previousMultiIndex || geometryIndex > prevGeomIndex) {
              previousCoords = currentCoord;
              previousFeatureIndex = featureIndex;
              previousMultiIndex = multiPartIndexCoord;
              prevGeomIndex = geometryIndex;
              segmentIndex = 0;
              return;
            }
            var currentSegment = helpers.lineString([previousCoords, currentCoord], feature2.properties);
            if (callback(currentSegment, featureIndex, multiFeatureIndex, geometryIndex, segmentIndex) === false)
              return false;
            segmentIndex++;
            previousCoords = currentCoord;
          }) === false)
            return false;
        });
      }
      function segmentReduce2(geojson, callback, initialValue) {
        var previousValue = initialValue;
        var started = false;
        segmentEach2(geojson, function(currentSegment, featureIndex, multiFeatureIndex, geometryIndex, segmentIndex) {
          if (started === false && initialValue === void 0)
            previousValue = currentSegment;
          else
            previousValue = callback(previousValue, currentSegment, featureIndex, multiFeatureIndex, geometryIndex, segmentIndex);
          started = true;
        });
        return previousValue;
      }
      function lineEach(geojson, callback) {
        if (!geojson)
          throw new Error("geojson is required");
        flattenEach2(geojson, function(feature2, featureIndex, multiFeatureIndex) {
          if (feature2.geometry === null)
            return;
          var type = feature2.geometry.type;
          var coords = feature2.geometry.coordinates;
          switch (type) {
            case "LineString":
              if (callback(feature2, featureIndex, multiFeatureIndex, 0, 0) === false)
                return false;
              break;
            case "Polygon":
              for (var geometryIndex = 0; geometryIndex < coords.length; geometryIndex++) {
                if (callback(helpers.lineString(coords[geometryIndex], feature2.properties), featureIndex, multiFeatureIndex, geometryIndex) === false)
                  return false;
              }
              break;
          }
        });
      }
      function lineReduce(geojson, callback, initialValue) {
        var previousValue = initialValue;
        lineEach(geojson, function(currentLine, featureIndex, multiFeatureIndex, geometryIndex) {
          if (featureIndex === 0 && initialValue === void 0)
            previousValue = currentLine;
          else
            previousValue = callback(previousValue, currentLine, featureIndex, multiFeatureIndex, geometryIndex);
        });
        return previousValue;
      }
      function findSegment(geojson, options) {
        options = options || {};
        if (!helpers.isObject(options))
          throw new Error("options is invalid");
        var featureIndex = options.featureIndex || 0;
        var multiFeatureIndex = options.multiFeatureIndex || 0;
        var geometryIndex = options.geometryIndex || 0;
        var segmentIndex = options.segmentIndex || 0;
        var properties = options.properties;
        var geometry;
        switch (geojson.type) {
          case "FeatureCollection":
            if (featureIndex < 0)
              featureIndex = geojson.features.length + featureIndex;
            properties = properties || geojson.features[featureIndex].properties;
            geometry = geojson.features[featureIndex].geometry;
            break;
          case "Feature":
            properties = properties || geojson.properties;
            geometry = geojson.geometry;
            break;
          case "Point":
          case "MultiPoint":
            return null;
          case "LineString":
          case "Polygon":
          case "MultiLineString":
          case "MultiPolygon":
            geometry = geojson;
            break;
          default:
            throw new Error("geojson is invalid");
        }
        if (geometry === null)
          return null;
        var coords = geometry.coordinates;
        switch (geometry.type) {
          case "Point":
          case "MultiPoint":
            return null;
          case "LineString":
            if (segmentIndex < 0)
              segmentIndex = coords.length + segmentIndex - 1;
            return helpers.lineString([coords[segmentIndex], coords[segmentIndex + 1]], properties, options);
          case "Polygon":
            if (geometryIndex < 0)
              geometryIndex = coords.length + geometryIndex;
            if (segmentIndex < 0)
              segmentIndex = coords[geometryIndex].length + segmentIndex - 1;
            return helpers.lineString([
              coords[geometryIndex][segmentIndex],
              coords[geometryIndex][segmentIndex + 1]
            ], properties, options);
          case "MultiLineString":
            if (multiFeatureIndex < 0)
              multiFeatureIndex = coords.length + multiFeatureIndex;
            if (segmentIndex < 0)
              segmentIndex = coords[multiFeatureIndex].length + segmentIndex - 1;
            return helpers.lineString([
              coords[multiFeatureIndex][segmentIndex],
              coords[multiFeatureIndex][segmentIndex + 1]
            ], properties, options);
          case "MultiPolygon":
            if (multiFeatureIndex < 0)
              multiFeatureIndex = coords.length + multiFeatureIndex;
            if (geometryIndex < 0)
              geometryIndex = coords[multiFeatureIndex].length + geometryIndex;
            if (segmentIndex < 0)
              segmentIndex = coords[multiFeatureIndex][geometryIndex].length - segmentIndex - 1;
            return helpers.lineString([
              coords[multiFeatureIndex][geometryIndex][segmentIndex],
              coords[multiFeatureIndex][geometryIndex][segmentIndex + 1]
            ], properties, options);
        }
        throw new Error("geojson is invalid");
      }
      function findPoint(geojson, options) {
        options = options || {};
        if (!helpers.isObject(options))
          throw new Error("options is invalid");
        var featureIndex = options.featureIndex || 0;
        var multiFeatureIndex = options.multiFeatureIndex || 0;
        var geometryIndex = options.geometryIndex || 0;
        var coordIndex = options.coordIndex || 0;
        var properties = options.properties;
        var geometry;
        switch (geojson.type) {
          case "FeatureCollection":
            if (featureIndex < 0)
              featureIndex = geojson.features.length + featureIndex;
            properties = properties || geojson.features[featureIndex].properties;
            geometry = geojson.features[featureIndex].geometry;
            break;
          case "Feature":
            properties = properties || geojson.properties;
            geometry = geojson.geometry;
            break;
          case "Point":
          case "MultiPoint":
            return null;
          case "LineString":
          case "Polygon":
          case "MultiLineString":
          case "MultiPolygon":
            geometry = geojson;
            break;
          default:
            throw new Error("geojson is invalid");
        }
        if (geometry === null)
          return null;
        var coords = geometry.coordinates;
        switch (geometry.type) {
          case "Point":
            return helpers.point(coords, properties, options);
          case "MultiPoint":
            if (multiFeatureIndex < 0)
              multiFeatureIndex = coords.length + multiFeatureIndex;
            return helpers.point(coords[multiFeatureIndex], properties, options);
          case "LineString":
            if (coordIndex < 0)
              coordIndex = coords.length + coordIndex;
            return helpers.point(coords[coordIndex], properties, options);
          case "Polygon":
            if (geometryIndex < 0)
              geometryIndex = coords.length + geometryIndex;
            if (coordIndex < 0)
              coordIndex = coords[geometryIndex].length + coordIndex;
            return helpers.point(coords[geometryIndex][coordIndex], properties, options);
          case "MultiLineString":
            if (multiFeatureIndex < 0)
              multiFeatureIndex = coords.length + multiFeatureIndex;
            if (coordIndex < 0)
              coordIndex = coords[multiFeatureIndex].length + coordIndex;
            return helpers.point(coords[multiFeatureIndex][coordIndex], properties, options);
          case "MultiPolygon":
            if (multiFeatureIndex < 0)
              multiFeatureIndex = coords.length + multiFeatureIndex;
            if (geometryIndex < 0)
              geometryIndex = coords[multiFeatureIndex].length + geometryIndex;
            if (coordIndex < 0)
              coordIndex = coords[multiFeatureIndex][geometryIndex].length - coordIndex;
            return helpers.point(coords[multiFeatureIndex][geometryIndex][coordIndex], properties, options);
        }
        throw new Error("geojson is invalid");
      }
      exports.coordAll = coordAll;
      exports.coordEach = coordEach2;
      exports.coordReduce = coordReduce;
      exports.featureEach = featureEach2;
      exports.featureReduce = featureReduce;
      exports.findPoint = findPoint;
      exports.findSegment = findSegment;
      exports.flattenEach = flattenEach2;
      exports.flattenReduce = flattenReduce;
      exports.geomEach = geomEach2;
      exports.geomReduce = geomReduce;
      exports.lineEach = lineEach;
      exports.lineReduce = lineReduce;
      exports.propEach = propEach;
      exports.propReduce = propReduce;
      exports.segmentEach = segmentEach2;
      exports.segmentReduce = segmentReduce2;
    }
  });

  // node_modules/@turf/bbox/dist/js/index.js
  var require_js3 = __commonJS({
    "node_modules/@turf/bbox/dist/js/index.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      var meta_1 = require_js2();
      function bbox2(geojson) {
        var result = [Infinity, Infinity, -Infinity, -Infinity];
        meta_1.coordEach(geojson, function(coord) {
          if (result[0] > coord[0]) {
            result[0] = coord[0];
          }
          if (result[1] > coord[1]) {
            result[1] = coord[1];
          }
          if (result[2] < coord[0]) {
            result[2] = coord[0];
          }
          if (result[3] < coord[1]) {
            result[3] = coord[1];
          }
        });
        return result;
      }
      bbox2["default"] = bbox2;
      exports.default = bbox2;
    }
  });

  // node_modules/geojson-rbush/index.js
  var require_geojson_rbush = __commonJS({
    "node_modules/geojson-rbush/index.js"(exports, module) {
      var rbush2 = require_rbush_min();
      var helpers = require_js();
      var meta = require_js2();
      var turfBBox = require_js3().default;
      var featureEach2 = meta.featureEach;
      var coordEach2 = meta.coordEach;
      var polygon = helpers.polygon;
      var featureCollection2 = helpers.featureCollection;
      function geojsonRbush(maxEntries) {
        var tree = new rbush2(maxEntries);
        tree.insert = function(feature2) {
          if (feature2.type !== "Feature")
            throw new Error("invalid feature");
          feature2.bbox = feature2.bbox ? feature2.bbox : turfBBox(feature2);
          return rbush2.prototype.insert.call(this, feature2);
        };
        tree.load = function(features) {
          var load = [];
          if (Array.isArray(features)) {
            features.forEach(function(feature2) {
              if (feature2.type !== "Feature")
                throw new Error("invalid features");
              feature2.bbox = feature2.bbox ? feature2.bbox : turfBBox(feature2);
              load.push(feature2);
            });
          } else {
            featureEach2(features, function(feature2) {
              if (feature2.type !== "Feature")
                throw new Error("invalid features");
              feature2.bbox = feature2.bbox ? feature2.bbox : turfBBox(feature2);
              load.push(feature2);
            });
          }
          return rbush2.prototype.load.call(this, load);
        };
        tree.remove = function(feature2, equals) {
          if (feature2.type !== "Feature")
            throw new Error("invalid feature");
          feature2.bbox = feature2.bbox ? feature2.bbox : turfBBox(feature2);
          return rbush2.prototype.remove.call(this, feature2, equals);
        };
        tree.clear = function() {
          return rbush2.prototype.clear.call(this);
        };
        tree.search = function(geojson) {
          var features = rbush2.prototype.search.call(this, this.toBBox(geojson));
          return featureCollection2(features);
        };
        tree.collides = function(geojson) {
          return rbush2.prototype.collides.call(this, this.toBBox(geojson));
        };
        tree.all = function() {
          var features = rbush2.prototype.all.call(this);
          return featureCollection2(features);
        };
        tree.toJSON = function() {
          return rbush2.prototype.toJSON.call(this);
        };
        tree.fromJSON = function(json) {
          return rbush2.prototype.fromJSON.call(this, json);
        };
        tree.toBBox = function(geojson) {
          var bbox2;
          if (geojson.bbox)
            bbox2 = geojson.bbox;
          else if (Array.isArray(geojson) && geojson.length === 4)
            bbox2 = geojson;
          else if (Array.isArray(geojson) && geojson.length === 6)
            bbox2 = [geojson[0], geojson[1], geojson[3], geojson[4]];
          else if (geojson.type === "Feature")
            bbox2 = turfBBox(geojson);
          else if (geojson.type === "FeatureCollection")
            bbox2 = turfBBox(geojson);
          else
            throw new Error("invalid geojson");
          return {
            minX: bbox2[0],
            minY: bbox2[1],
            maxX: bbox2[2],
            maxY: bbox2[3]
          };
        };
        return tree;
      }
      module.exports = geojsonRbush;
      module.exports.default = geojsonRbush;
    }
  });

  // node_modules/fp-ts/lib/function.js
  var require_function = __commonJS({
    "node_modules/fp-ts/lib/function.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.getEndomorphismMonoid = exports.not = exports.SK = exports.hole = exports.pipe = exports.untupled = exports.tupled = exports.absurd = exports.decrement = exports.increment = exports.tuple = exports.flow = exports.flip = exports.constVoid = exports.constUndefined = exports.constNull = exports.constFalse = exports.constTrue = exports.constant = exports.unsafeCoerce = exports.identity = exports.apply = exports.getRing = exports.getSemiring = exports.getMonoid = exports.getSemigroup = exports.getBooleanAlgebra = void 0;
      var getBooleanAlgebra = function(B) {
        return function() {
          return {
            meet: function(x, y) {
              return function(a) {
                return B.meet(x(a), y(a));
              };
            },
            join: function(x, y) {
              return function(a) {
                return B.join(x(a), y(a));
              };
            },
            zero: function() {
              return B.zero;
            },
            one: function() {
              return B.one;
            },
            implies: function(x, y) {
              return function(a) {
                return B.implies(x(a), y(a));
              };
            },
            not: function(x) {
              return function(a) {
                return B.not(x(a));
              };
            }
          };
        };
      };
      exports.getBooleanAlgebra = getBooleanAlgebra;
      var getSemigroup = function(S) {
        return function() {
          return {
            concat: function(f, g) {
              return function(a) {
                return S.concat(f(a), g(a));
              };
            }
          };
        };
      };
      exports.getSemigroup = getSemigroup;
      var getMonoid = function(M) {
        var getSemigroupM = exports.getSemigroup(M);
        return function() {
          return {
            concat: getSemigroupM().concat,
            empty: function() {
              return M.empty;
            }
          };
        };
      };
      exports.getMonoid = getMonoid;
      var getSemiring = function(S) {
        return {
          add: function(f, g) {
            return function(x) {
              return S.add(f(x), g(x));
            };
          },
          zero: function() {
            return S.zero;
          },
          mul: function(f, g) {
            return function(x) {
              return S.mul(f(x), g(x));
            };
          },
          one: function() {
            return S.one;
          }
        };
      };
      exports.getSemiring = getSemiring;
      var getRing = function(R) {
        var S = exports.getSemiring(R);
        return {
          add: S.add,
          mul: S.mul,
          one: S.one,
          zero: S.zero,
          sub: function(f, g) {
            return function(x) {
              return R.sub(f(x), g(x));
            };
          }
        };
      };
      exports.getRing = getRing;
      var apply = function(a) {
        return function(f) {
          return f(a);
        };
      };
      exports.apply = apply;
      function identity(a) {
        return a;
      }
      exports.identity = identity;
      exports.unsafeCoerce = identity;
      function constant(a) {
        return function() {
          return a;
        };
      }
      exports.constant = constant;
      exports.constTrue = /* @__PURE__ */ constant(true);
      exports.constFalse = /* @__PURE__ */ constant(false);
      exports.constNull = /* @__PURE__ */ constant(null);
      exports.constUndefined = /* @__PURE__ */ constant(void 0);
      exports.constVoid = exports.constUndefined;
      function flip(f) {
        return function(b, a) {
          return f(a, b);
        };
      }
      exports.flip = flip;
      function flow(ab, bc, cd, de, ef, fg, gh, hi, ij) {
        switch (arguments.length) {
          case 1:
            return ab;
          case 2:
            return function() {
              return bc(ab.apply(this, arguments));
            };
          case 3:
            return function() {
              return cd(bc(ab.apply(this, arguments)));
            };
          case 4:
            return function() {
              return de(cd(bc(ab.apply(this, arguments))));
            };
          case 5:
            return function() {
              return ef(de(cd(bc(ab.apply(this, arguments)))));
            };
          case 6:
            return function() {
              return fg(ef(de(cd(bc(ab.apply(this, arguments))))));
            };
          case 7:
            return function() {
              return gh(fg(ef(de(cd(bc(ab.apply(this, arguments)))))));
            };
          case 8:
            return function() {
              return hi(gh(fg(ef(de(cd(bc(ab.apply(this, arguments))))))));
            };
          case 9:
            return function() {
              return ij(hi(gh(fg(ef(de(cd(bc(ab.apply(this, arguments)))))))));
            };
        }
        return;
      }
      exports.flow = flow;
      function tuple() {
        var t = [];
        for (var _i = 0; _i < arguments.length; _i++) {
          t[_i] = arguments[_i];
        }
        return t;
      }
      exports.tuple = tuple;
      function increment(n) {
        return n + 1;
      }
      exports.increment = increment;
      function decrement(n) {
        return n - 1;
      }
      exports.decrement = decrement;
      function absurd(_) {
        throw new Error("Called `absurd` function which should be uncallable");
      }
      exports.absurd = absurd;
      function tupled(f) {
        return function(a) {
          return f.apply(void 0, a);
        };
      }
      exports.tupled = tupled;
      function untupled(f) {
        return function() {
          var a = [];
          for (var _i = 0; _i < arguments.length; _i++) {
            a[_i] = arguments[_i];
          }
          return f(a);
        };
      }
      exports.untupled = untupled;
      function pipe2(a, ab, bc, cd, de, ef, fg, gh, hi) {
        switch (arguments.length) {
          case 1:
            return a;
          case 2:
            return ab(a);
          case 3:
            return bc(ab(a));
          case 4:
            return cd(bc(ab(a)));
          case 5:
            return de(cd(bc(ab(a))));
          case 6:
            return ef(de(cd(bc(ab(a)))));
          case 7:
            return fg(ef(de(cd(bc(ab(a))))));
          case 8:
            return gh(fg(ef(de(cd(bc(ab(a)))))));
          case 9:
            return hi(gh(fg(ef(de(cd(bc(ab(a))))))));
          default:
            var ret = arguments[0];
            for (var i = 1; i < arguments.length; i++) {
              ret = arguments[i](ret);
            }
            return ret;
        }
      }
      exports.pipe = pipe2;
      exports.hole = absurd;
      var SK = function(_, b) {
        return b;
      };
      exports.SK = SK;
      function not(predicate) {
        return function(a) {
          return !predicate(a);
        };
      }
      exports.not = not;
      var getEndomorphismMonoid = function() {
        return {
          concat: function(first, second) {
            return flow(first, second);
          },
          empty: identity
        };
      };
      exports.getEndomorphismMonoid = getEndomorphismMonoid;
    }
  });

  // node_modules/fp-ts/lib/Apply.js
  var require_Apply = __commonJS({
    "node_modules/fp-ts/lib/Apply.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.sequenceS = exports.sequenceT = exports.getApplySemigroup = exports.apS = exports.apSecond = exports.apFirst = exports.ap = void 0;
      var function_1 = require_function();
      function ap(F, G) {
        return function(fa) {
          return function(fab) {
            return F.ap(F.map(fab, function(gab) {
              return function(ga) {
                return G.ap(gab, ga);
              };
            }), fa);
          };
        };
      }
      exports.ap = ap;
      function apFirst(A) {
        return function(second) {
          return function(first) {
            return A.ap(A.map(first, function(a) {
              return function() {
                return a;
              };
            }), second);
          };
        };
      }
      exports.apFirst = apFirst;
      function apSecond(A) {
        return function(second) {
          return function(first) {
            return A.ap(A.map(first, function() {
              return function(b) {
                return b;
              };
            }), second);
          };
        };
      }
      exports.apSecond = apSecond;
      function apS(F) {
        return function(name, fb) {
          return function(fa) {
            return F.ap(F.map(fa, function(a) {
              return function(b) {
                var _a;
                return Object.assign({}, a, (_a = {}, _a[name] = b, _a));
              };
            }), fb);
          };
        };
      }
      exports.apS = apS;
      function getApplySemigroup(F) {
        return function(S) {
          return {
            concat: function(first, second) {
              return F.ap(F.map(first, function(x) {
                return function(y) {
                  return S.concat(x, y);
                };
              }), second);
            }
          };
        };
      }
      exports.getApplySemigroup = getApplySemigroup;
      function curried(f, n, acc) {
        return function(x) {
          var combined = Array(acc.length + 1);
          for (var i = 0; i < acc.length; i++) {
            combined[i] = acc[i];
          }
          combined[acc.length] = x;
          return n === 0 ? f.apply(null, combined) : curried(f, n - 1, combined);
        };
      }
      var tupleConstructors = {
        1: function(a) {
          return [a];
        },
        2: function(a) {
          return function(b) {
            return [a, b];
          };
        },
        3: function(a) {
          return function(b) {
            return function(c) {
              return [a, b, c];
            };
          };
        },
        4: function(a) {
          return function(b) {
            return function(c) {
              return function(d) {
                return [a, b, c, d];
              };
            };
          };
        },
        5: function(a) {
          return function(b) {
            return function(c) {
              return function(d) {
                return function(e) {
                  return [a, b, c, d, e];
                };
              };
            };
          };
        }
      };
      function getTupleConstructor(len) {
        if (!tupleConstructors.hasOwnProperty(len)) {
          tupleConstructors[len] = curried(function_1.tuple, len - 1, []);
        }
        return tupleConstructors[len];
      }
      function sequenceT(F) {
        return function() {
          var args = [];
          for (var _i = 0; _i < arguments.length; _i++) {
            args[_i] = arguments[_i];
          }
          var len = args.length;
          var f = getTupleConstructor(len);
          var fas = F.map(args[0], f);
          for (var i = 1; i < len; i++) {
            fas = F.ap(fas, args[i]);
          }
          return fas;
        };
      }
      exports.sequenceT = sequenceT;
      function getRecordConstructor(keys) {
        var len = keys.length;
        switch (len) {
          case 1:
            return function(a) {
              var _a;
              return _a = {}, _a[keys[0]] = a, _a;
            };
          case 2:
            return function(a) {
              return function(b) {
                var _a;
                return _a = {}, _a[keys[0]] = a, _a[keys[1]] = b, _a;
              };
            };
          case 3:
            return function(a) {
              return function(b) {
                return function(c) {
                  var _a;
                  return _a = {}, _a[keys[0]] = a, _a[keys[1]] = b, _a[keys[2]] = c, _a;
                };
              };
            };
          case 4:
            return function(a) {
              return function(b) {
                return function(c) {
                  return function(d) {
                    var _a;
                    return _a = {}, _a[keys[0]] = a, _a[keys[1]] = b, _a[keys[2]] = c, _a[keys[3]] = d, _a;
                  };
                };
              };
            };
          case 5:
            return function(a) {
              return function(b) {
                return function(c) {
                  return function(d) {
                    return function(e) {
                      var _a;
                      return _a = {}, _a[keys[0]] = a, _a[keys[1]] = b, _a[keys[2]] = c, _a[keys[3]] = d, _a[keys[4]] = e, _a;
                    };
                  };
                };
              };
            };
          default:
            return curried(function() {
              var args = [];
              for (var _i = 0; _i < arguments.length; _i++) {
                args[_i] = arguments[_i];
              }
              var r = {};
              for (var i = 0; i < len; i++) {
                r[keys[i]] = args[i];
              }
              return r;
            }, len - 1, []);
        }
      }
      function sequenceS(F) {
        return function(r) {
          var keys = Object.keys(r);
          var len = keys.length;
          var f = getRecordConstructor(keys);
          var fr = F.map(r[keys[0]], f);
          for (var i = 1; i < len; i++) {
            fr = F.ap(fr, r[keys[i]]);
          }
          return fr;
        };
      }
      exports.sequenceS = sequenceS;
    }
  });

  // node_modules/fp-ts/lib/Functor.js
  var require_Functor = __commonJS({
    "node_modules/fp-ts/lib/Functor.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.getFunctorComposition = exports.bindTo = exports.flap = exports.map = void 0;
      var function_1 = require_function();
      function map(F, G) {
        return function(f) {
          return function(fa) {
            return F.map(fa, function(ga) {
              return G.map(ga, f);
            });
          };
        };
      }
      exports.map = map;
      function flap(F) {
        return function(a) {
          return function(fab) {
            return F.map(fab, function(f) {
              return f(a);
            });
          };
        };
      }
      exports.flap = flap;
      function bindTo(F) {
        return function(name) {
          return function(fa) {
            return F.map(fa, function(a) {
              var _a;
              return _a = {}, _a[name] = a, _a;
            });
          };
        };
      }
      exports.bindTo = bindTo;
      function getFunctorComposition(F, G) {
        var _map = map(F, G);
        return {
          map: function(fga, f) {
            return function_1.pipe(fga, _map(f));
          }
        };
      }
      exports.getFunctorComposition = getFunctorComposition;
    }
  });

  // node_modules/fp-ts/lib/Applicative.js
  var require_Applicative = __commonJS({
    "node_modules/fp-ts/lib/Applicative.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.getApplicativeComposition = exports.getApplicativeMonoid = void 0;
      var Apply_1 = require_Apply();
      var function_1 = require_function();
      var Functor_1 = require_Functor();
      function getApplicativeMonoid(F) {
        var f = Apply_1.getApplySemigroup(F);
        return function(M) {
          return {
            concat: f(M).concat,
            empty: F.of(M.empty)
          };
        };
      }
      exports.getApplicativeMonoid = getApplicativeMonoid;
      function getApplicativeComposition(F, G) {
        var map = Functor_1.getFunctorComposition(F, G).map;
        var _ap = Apply_1.ap(F, G);
        return {
          map,
          of: function(a) {
            return F.of(G.of(a));
          },
          ap: function(fgab, fga) {
            return function_1.pipe(fgab, _ap(fga));
          }
        };
      }
      exports.getApplicativeComposition = getApplicativeComposition;
    }
  });

  // node_modules/fp-ts/lib/Chain.js
  var require_Chain = __commonJS({
    "node_modules/fp-ts/lib/Chain.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.bind = exports.chainFirst = void 0;
      function chainFirst(M) {
        return function(f) {
          return function(first) {
            return M.chain(first, function(a) {
              return M.map(f(a), function() {
                return a;
              });
            });
          };
        };
      }
      exports.chainFirst = chainFirst;
      function bind(M) {
        return function(name, f) {
          return function(ma) {
            return M.chain(ma, function(a) {
              return M.map(f(a), function(b) {
                var _a;
                return Object.assign({}, a, (_a = {}, _a[name] = b, _a));
              });
            });
          };
        };
      }
      exports.bind = bind;
    }
  });

  // node_modules/fp-ts/lib/internal.js
  var require_internal = __commonJS({
    "node_modules/fp-ts/lib/internal.js"(exports) {
      "use strict";
      var __spreadArray = exports && exports.__spreadArray || function(to, from) {
        for (var i = 0, il = from.length, j = to.length; i < il; i++, j++)
          to[j] = from[i];
        return to;
      };
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.fromReadonlyNonEmptyArray = exports.has = exports.emptyRecord = exports.emptyReadonlyArray = exports.tail = exports.head = exports.isNonEmpty = exports.singleton = exports.right = exports.left = exports.isRight = exports.isLeft = exports.some = exports.none = exports.isSome = exports.isNone = void 0;
      var isNone = function(fa) {
        return fa._tag === "None";
      };
      exports.isNone = isNone;
      var isSome = function(fa) {
        return fa._tag === "Some";
      };
      exports.isSome = isSome;
      exports.none = { _tag: "None" };
      var some = function(a) {
        return { _tag: "Some", value: a };
      };
      exports.some = some;
      var isLeft = function(ma) {
        return ma._tag === "Left";
      };
      exports.isLeft = isLeft;
      var isRight = function(ma) {
        return ma._tag === "Right";
      };
      exports.isRight = isRight;
      var left = function(e) {
        return { _tag: "Left", left: e };
      };
      exports.left = left;
      var right = function(a) {
        return { _tag: "Right", right: a };
      };
      exports.right = right;
      var singleton = function(a) {
        return [a];
      };
      exports.singleton = singleton;
      var isNonEmpty = function(as) {
        return as.length > 0;
      };
      exports.isNonEmpty = isNonEmpty;
      var head = function(as) {
        return as[0];
      };
      exports.head = head;
      var tail = function(as) {
        return as.slice(1);
      };
      exports.tail = tail;
      exports.emptyReadonlyArray = [];
      exports.emptyRecord = {};
      exports.has = Object.prototype.hasOwnProperty;
      var fromReadonlyNonEmptyArray = function(as) {
        return __spreadArray([as[0]], as.slice(1));
      };
      exports.fromReadonlyNonEmptyArray = fromReadonlyNonEmptyArray;
    }
  });

  // node_modules/fp-ts/lib/FromEither.js
  var require_FromEither = __commonJS({
    "node_modules/fp-ts/lib/FromEither.js"(exports) {
      "use strict";
      var __createBinding = exports && exports.__createBinding || (Object.create ? function(o, m, k, k2) {
        if (k2 === void 0)
          k2 = k;
        Object.defineProperty(o, k2, { enumerable: true, get: function() {
          return m[k];
        } });
      } : function(o, m, k, k2) {
        if (k2 === void 0)
          k2 = k;
        o[k2] = m[k];
      });
      var __setModuleDefault = exports && exports.__setModuleDefault || (Object.create ? function(o, v) {
        Object.defineProperty(o, "default", { enumerable: true, value: v });
      } : function(o, v) {
        o["default"] = v;
      });
      var __importStar = exports && exports.__importStar || function(mod) {
        if (mod && mod.__esModule)
          return mod;
        var result = {};
        if (mod != null) {
          for (var k in mod)
            if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k))
              __createBinding(result, mod, k);
        }
        __setModuleDefault(result, mod);
        return result;
      };
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.filterOrElse = exports.chainEitherK = exports.fromEitherK = exports.chainOptionK = exports.fromOptionK = exports.fromPredicate = exports.fromOption = void 0;
      var function_1 = require_function();
      var _ = __importStar(require_internal());
      function fromOption(F) {
        return function(onNone) {
          return function(ma) {
            return F.fromEither(_.isNone(ma) ? _.left(onNone()) : _.right(ma.value));
          };
        };
      }
      exports.fromOption = fromOption;
      function fromPredicate(F) {
        return function(predicate, onFalse) {
          return function(a) {
            return F.fromEither(predicate(a) ? _.right(a) : _.left(onFalse(a)));
          };
        };
      }
      exports.fromPredicate = fromPredicate;
      function fromOptionK(F) {
        var fromOptionF = fromOption(F);
        return function(onNone) {
          var from = fromOptionF(onNone);
          return function(f) {
            return function_1.flow(f, from);
          };
        };
      }
      exports.fromOptionK = fromOptionK;
      function chainOptionK(F, M) {
        var fromOptionKF = fromOptionK(F);
        return function(onNone) {
          var from = fromOptionKF(onNone);
          return function(f) {
            return function(ma) {
              return M.chain(ma, from(f));
            };
          };
        };
      }
      exports.chainOptionK = chainOptionK;
      function fromEitherK(F) {
        return function(f) {
          return function_1.flow(f, F.fromEither);
        };
      }
      exports.fromEitherK = fromEitherK;
      function chainEitherK(F, M) {
        var fromEitherKF = fromEitherK(F);
        return function(f) {
          return function(ma) {
            return M.chain(ma, fromEitherKF(f));
          };
        };
      }
      exports.chainEitherK = chainEitherK;
      function filterOrElse(F, M) {
        return function(predicate, onFalse) {
          return function(ma) {
            return M.chain(ma, function(a) {
              return F.fromEither(predicate(a) ? _.right(a) : _.left(onFalse(a)));
            });
          };
        };
      }
      exports.filterOrElse = filterOrElse;
    }
  });

  // node_modules/fp-ts/lib/Predicate.js
  var require_Predicate = __commonJS({
    "node_modules/fp-ts/lib/Predicate.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.and = exports.or = exports.not = exports.Contravariant = exports.getMonoidAll = exports.getSemigroupAll = exports.getMonoidAny = exports.getSemigroupAny = exports.URI = exports.contramap = void 0;
      var function_1 = require_function();
      var contramap_ = function(predicate, f) {
        return function_1.pipe(predicate, exports.contramap(f));
      };
      var contramap = function(f) {
        return function(predicate) {
          return function_1.flow(f, predicate);
        };
      };
      exports.contramap = contramap;
      exports.URI = "Predicate";
      var getSemigroupAny = function() {
        return {
          concat: function(first, second) {
            return function_1.pipe(first, exports.or(second));
          }
        };
      };
      exports.getSemigroupAny = getSemigroupAny;
      var getMonoidAny = function() {
        return {
          concat: exports.getSemigroupAny().concat,
          empty: function_1.constFalse
        };
      };
      exports.getMonoidAny = getMonoidAny;
      var getSemigroupAll = function() {
        return {
          concat: function(first, second) {
            return function_1.pipe(first, exports.and(second));
          }
        };
      };
      exports.getSemigroupAll = getSemigroupAll;
      var getMonoidAll = function() {
        return {
          concat: exports.getSemigroupAll().concat,
          empty: function_1.constTrue
        };
      };
      exports.getMonoidAll = getMonoidAll;
      exports.Contravariant = {
        URI: exports.URI,
        contramap: contramap_
      };
      var not = function(predicate) {
        return function(a) {
          return !predicate(a);
        };
      };
      exports.not = not;
      var or = function(second) {
        return function(first) {
          return function(a) {
            return first(a) || second(a);
          };
        };
      };
      exports.or = or;
      var and = function(second) {
        return function(first) {
          return function(a) {
            return first(a) && second(a);
          };
        };
      };
      exports.and = and;
    }
  });

  // node_modules/fp-ts/lib/Magma.js
  var require_Magma = __commonJS({
    "node_modules/fp-ts/lib/Magma.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.concatAll = exports.endo = exports.filterSecond = exports.filterFirst = exports.reverse = void 0;
      var reverse = function(M) {
        return {
          concat: function(first, second) {
            return M.concat(second, first);
          }
        };
      };
      exports.reverse = reverse;
      var filterFirst = function(predicate) {
        return function(M) {
          return {
            concat: function(first, second) {
              return predicate(first) ? M.concat(first, second) : second;
            }
          };
        };
      };
      exports.filterFirst = filterFirst;
      var filterSecond = function(predicate) {
        return function(M) {
          return {
            concat: function(first, second) {
              return predicate(second) ? M.concat(first, second) : first;
            }
          };
        };
      };
      exports.filterSecond = filterSecond;
      var endo = function(f) {
        return function(M) {
          return {
            concat: function(first, second) {
              return M.concat(f(first), f(second));
            }
          };
        };
      };
      exports.endo = endo;
      var concatAll = function(M) {
        return function(startWith) {
          return function(as) {
            return as.reduce(function(a, acc) {
              return M.concat(a, acc);
            }, startWith);
          };
        };
      };
      exports.concatAll = concatAll;
    }
  });

  // node_modules/fp-ts/lib/Eq.js
  var require_Eq = __commonJS({
    "node_modules/fp-ts/lib/Eq.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.eqDate = exports.eqNumber = exports.eqString = exports.eqBoolean = exports.eq = exports.strictEqual = exports.getStructEq = exports.getTupleEq = exports.Contravariant = exports.getMonoid = exports.getSemigroup = exports.eqStrict = exports.URI = exports.contramap = exports.tuple = exports.struct = exports.fromEquals = void 0;
      var function_1 = require_function();
      var fromEquals = function(equals) {
        return {
          equals: function(x, y) {
            return x === y || equals(x, y);
          }
        };
      };
      exports.fromEquals = fromEquals;
      var struct = function(eqs) {
        return exports.fromEquals(function(first, second) {
          for (var key in eqs) {
            if (!eqs[key].equals(first[key], second[key])) {
              return false;
            }
          }
          return true;
        });
      };
      exports.struct = struct;
      var tuple = function() {
        var eqs = [];
        for (var _i = 0; _i < arguments.length; _i++) {
          eqs[_i] = arguments[_i];
        }
        return exports.fromEquals(function(first, second) {
          return eqs.every(function(E, i) {
            return E.equals(first[i], second[i]);
          });
        });
      };
      exports.tuple = tuple;
      var contramap_ = function(fa, f) {
        return function_1.pipe(fa, exports.contramap(f));
      };
      var contramap = function(f) {
        return function(fa) {
          return exports.fromEquals(function(x, y) {
            return fa.equals(f(x), f(y));
          });
        };
      };
      exports.contramap = contramap;
      exports.URI = "Eq";
      exports.eqStrict = {
        equals: function(a, b) {
          return a === b;
        }
      };
      var empty = {
        equals: function() {
          return true;
        }
      };
      var getSemigroup = function() {
        return {
          concat: function(x, y) {
            return exports.fromEquals(function(a, b) {
              return x.equals(a, b) && y.equals(a, b);
            });
          }
        };
      };
      exports.getSemigroup = getSemigroup;
      var getMonoid = function() {
        return {
          concat: exports.getSemigroup().concat,
          empty
        };
      };
      exports.getMonoid = getMonoid;
      exports.Contravariant = {
        URI: exports.URI,
        contramap: contramap_
      };
      exports.getTupleEq = exports.tuple;
      exports.getStructEq = exports.struct;
      exports.strictEqual = exports.eqStrict.equals;
      exports.eq = exports.Contravariant;
      exports.eqBoolean = exports.eqStrict;
      exports.eqString = exports.eqStrict;
      exports.eqNumber = exports.eqStrict;
      exports.eqDate = {
        equals: function(first, second) {
          return first.valueOf() === second.valueOf();
        }
      };
    }
  });

  // node_modules/fp-ts/lib/Ord.js
  var require_Ord = __commonJS({
    "node_modules/fp-ts/lib/Ord.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.ordDate = exports.ordNumber = exports.ordString = exports.ordBoolean = exports.ord = exports.getDualOrd = exports.getTupleOrd = exports.between = exports.clamp = exports.max = exports.min = exports.geq = exports.leq = exports.gt = exports.lt = exports.equals = exports.trivial = exports.Contravariant = exports.getMonoid = exports.getSemigroup = exports.URI = exports.contramap = exports.reverse = exports.tuple = exports.fromCompare = exports.equalsDefault = void 0;
      var Eq_1 = require_Eq();
      var function_1 = require_function();
      var equalsDefault = function(compare2) {
        return function(first, second) {
          return first === second || compare2(first, second) === 0;
        };
      };
      exports.equalsDefault = equalsDefault;
      var fromCompare = function(compare2) {
        return {
          equals: exports.equalsDefault(compare2),
          compare: function(first, second) {
            return first === second ? 0 : compare2(first, second);
          }
        };
      };
      exports.fromCompare = fromCompare;
      var tuple = function() {
        var ords = [];
        for (var _i = 0; _i < arguments.length; _i++) {
          ords[_i] = arguments[_i];
        }
        return exports.fromCompare(function(first, second) {
          var i = 0;
          for (; i < ords.length - 1; i++) {
            var r = ords[i].compare(first[i], second[i]);
            if (r !== 0) {
              return r;
            }
          }
          return ords[i].compare(first[i], second[i]);
        });
      };
      exports.tuple = tuple;
      var reverse = function(O2) {
        return exports.fromCompare(function(first, second) {
          return O2.compare(second, first);
        });
      };
      exports.reverse = reverse;
      var contramap_ = function(fa, f) {
        return function_1.pipe(fa, exports.contramap(f));
      };
      var contramap = function(f) {
        return function(fa) {
          return exports.fromCompare(function(first, second) {
            return fa.compare(f(first), f(second));
          });
        };
      };
      exports.contramap = contramap;
      exports.URI = "Ord";
      var getSemigroup = function() {
        return {
          concat: function(first, second) {
            return exports.fromCompare(function(a, b) {
              var ox = first.compare(a, b);
              return ox !== 0 ? ox : second.compare(a, b);
            });
          }
        };
      };
      exports.getSemigroup = getSemigroup;
      var getMonoid = function() {
        return {
          concat: exports.getSemigroup().concat,
          empty: exports.fromCompare(function() {
            return 0;
          })
        };
      };
      exports.getMonoid = getMonoid;
      exports.Contravariant = {
        URI: exports.URI,
        contramap: contramap_
      };
      exports.trivial = {
        equals: function_1.constTrue,
        compare: /* @__PURE__ */ function_1.constant(0)
      };
      var equals = function(O2) {
        return function(second) {
          return function(first) {
            return first === second || O2.compare(first, second) === 0;
          };
        };
      };
      exports.equals = equals;
      var lt = function(O2) {
        return function(first, second) {
          return O2.compare(first, second) === -1;
        };
      };
      exports.lt = lt;
      var gt = function(O2) {
        return function(first, second) {
          return O2.compare(first, second) === 1;
        };
      };
      exports.gt = gt;
      var leq = function(O2) {
        return function(first, second) {
          return O2.compare(first, second) !== 1;
        };
      };
      exports.leq = leq;
      var geq = function(O2) {
        return function(first, second) {
          return O2.compare(first, second) !== -1;
        };
      };
      exports.geq = geq;
      var min = function(O2) {
        return function(first, second) {
          return first === second || O2.compare(first, second) < 1 ? first : second;
        };
      };
      exports.min = min;
      var max = function(O2) {
        return function(first, second) {
          return first === second || O2.compare(first, second) > -1 ? first : second;
        };
      };
      exports.max = max;
      var clamp = function(O2) {
        var minO = exports.min(O2);
        var maxO = exports.max(O2);
        return function(low, hi) {
          return function(a) {
            return maxO(minO(a, hi), low);
          };
        };
      };
      exports.clamp = clamp;
      var between = function(O2) {
        var ltO = exports.lt(O2);
        var gtO = exports.gt(O2);
        return function(low, hi) {
          return function(a) {
            return ltO(a, low) || gtO(a, hi) ? false : true;
          };
        };
      };
      exports.between = between;
      exports.getTupleOrd = exports.tuple;
      exports.getDualOrd = exports.reverse;
      exports.ord = exports.Contravariant;
      function compare(first, second) {
        return first < second ? -1 : first > second ? 1 : 0;
      }
      var strictOrd = {
        equals: Eq_1.eqStrict.equals,
        compare
      };
      exports.ordBoolean = strictOrd;
      exports.ordString = strictOrd;
      exports.ordNumber = strictOrd;
      exports.ordDate = /* @__PURE__ */ function_1.pipe(exports.ordNumber, /* @__PURE__ */ exports.contramap(function(date) {
        return date.valueOf();
      }));
    }
  });

  // node_modules/fp-ts/lib/Semigroup.js
  var require_Semigroup = __commonJS({
    "node_modules/fp-ts/lib/Semigroup.js"(exports) {
      "use strict";
      var __createBinding = exports && exports.__createBinding || (Object.create ? function(o, m, k, k2) {
        if (k2 === void 0)
          k2 = k;
        Object.defineProperty(o, k2, { enumerable: true, get: function() {
          return m[k];
        } });
      } : function(o, m, k, k2) {
        if (k2 === void 0)
          k2 = k;
        o[k2] = m[k];
      });
      var __setModuleDefault = exports && exports.__setModuleDefault || (Object.create ? function(o, v) {
        Object.defineProperty(o, "default", { enumerable: true, value: v });
      } : function(o, v) {
        o["default"] = v;
      });
      var __importStar = exports && exports.__importStar || function(mod) {
        if (mod && mod.__esModule)
          return mod;
        var result = {};
        if (mod != null) {
          for (var k in mod)
            if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k))
              __createBinding(result, mod, k);
        }
        __setModuleDefault(result, mod);
        return result;
      };
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.semigroupProduct = exports.semigroupSum = exports.semigroupString = exports.getFunctionSemigroup = exports.semigroupAny = exports.semigroupAll = exports.fold = exports.getIntercalateSemigroup = exports.getMeetSemigroup = exports.getJoinSemigroup = exports.getDualSemigroup = exports.getStructSemigroup = exports.getTupleSemigroup = exports.getFirstSemigroup = exports.getLastSemigroup = exports.getObjectSemigroup = exports.semigroupVoid = exports.concatAll = exports.last = exports.first = exports.intercalate = exports.tuple = exports.struct = exports.reverse = exports.constant = exports.max = exports.min = void 0;
      var function_1 = require_function();
      var _ = __importStar(require_internal());
      var M = __importStar(require_Magma());
      var Or = __importStar(require_Ord());
      var min = function(O2) {
        return {
          concat: Or.min(O2)
        };
      };
      exports.min = min;
      var max = function(O2) {
        return {
          concat: Or.max(O2)
        };
      };
      exports.max = max;
      var constant = function(a) {
        return {
          concat: function() {
            return a;
          }
        };
      };
      exports.constant = constant;
      exports.reverse = M.reverse;
      var struct = function(semigroups) {
        return {
          concat: function(first2, second) {
            var r = {};
            for (var k in semigroups) {
              if (_.has.call(semigroups, k)) {
                r[k] = semigroups[k].concat(first2[k], second[k]);
              }
            }
            return r;
          }
        };
      };
      exports.struct = struct;
      var tuple = function() {
        var semigroups = [];
        for (var _i = 0; _i < arguments.length; _i++) {
          semigroups[_i] = arguments[_i];
        }
        return {
          concat: function(first2, second) {
            return semigroups.map(function(s, i) {
              return s.concat(first2[i], second[i]);
            });
          }
        };
      };
      exports.tuple = tuple;
      var intercalate = function(middle) {
        return function(S) {
          return {
            concat: function(x, y) {
              return S.concat(x, S.concat(middle, y));
            }
          };
        };
      };
      exports.intercalate = intercalate;
      var first = function() {
        return { concat: function_1.identity };
      };
      exports.first = first;
      var last = function() {
        return { concat: function(_2, y) {
          return y;
        } };
      };
      exports.last = last;
      exports.concatAll = M.concatAll;
      exports.semigroupVoid = exports.constant(void 0);
      var getObjectSemigroup = function() {
        return {
          concat: function(first2, second) {
            return Object.assign({}, first2, second);
          }
        };
      };
      exports.getObjectSemigroup = getObjectSemigroup;
      exports.getLastSemigroup = exports.last;
      exports.getFirstSemigroup = exports.first;
      exports.getTupleSemigroup = exports.tuple;
      exports.getStructSemigroup = exports.struct;
      exports.getDualSemigroup = exports.reverse;
      exports.getJoinSemigroup = exports.max;
      exports.getMeetSemigroup = exports.min;
      exports.getIntercalateSemigroup = exports.intercalate;
      function fold(S) {
        var concatAllS = exports.concatAll(S);
        return function(startWith, as) {
          return as === void 0 ? concatAllS(startWith) : concatAllS(startWith)(as);
        };
      }
      exports.fold = fold;
      exports.semigroupAll = {
        concat: function(x, y) {
          return x && y;
        }
      };
      exports.semigroupAny = {
        concat: function(x, y) {
          return x || y;
        }
      };
      exports.getFunctionSemigroup = function_1.getSemigroup;
      exports.semigroupString = {
        concat: function(x, y) {
          return x + y;
        }
      };
      exports.semigroupSum = {
        concat: function(x, y) {
          return x + y;
        }
      };
      exports.semigroupProduct = {
        concat: function(x, y) {
          return x * y;
        }
      };
    }
  });

  // node_modules/fp-ts/lib/Separated.js
  var require_Separated = __commonJS({
    "node_modules/fp-ts/lib/Separated.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.right = exports.left = exports.flap = exports.Functor = exports.Bifunctor = exports.URI = exports.bimap = exports.mapLeft = exports.map = exports.separated = void 0;
      var function_1 = require_function();
      var Functor_1 = require_Functor();
      var separated = function(left2, right2) {
        return { left: left2, right: right2 };
      };
      exports.separated = separated;
      var _map = function(fa, f) {
        return function_1.pipe(fa, exports.map(f));
      };
      var _mapLeft = function(fa, f) {
        return function_1.pipe(fa, exports.mapLeft(f));
      };
      var _bimap = function(fa, g, f) {
        return function_1.pipe(fa, exports.bimap(g, f));
      };
      var map = function(f) {
        return function(fa) {
          return exports.separated(exports.left(fa), f(exports.right(fa)));
        };
      };
      exports.map = map;
      var mapLeft = function(f) {
        return function(fa) {
          return exports.separated(f(exports.left(fa)), exports.right(fa));
        };
      };
      exports.mapLeft = mapLeft;
      var bimap = function(f, g) {
        return function(fa) {
          return exports.separated(f(exports.left(fa)), g(exports.right(fa)));
        };
      };
      exports.bimap = bimap;
      exports.URI = "Separated";
      exports.Bifunctor = {
        URI: exports.URI,
        mapLeft: _mapLeft,
        bimap: _bimap
      };
      exports.Functor = {
        URI: exports.URI,
        map: _map
      };
      exports.flap = /* @__PURE__ */ Functor_1.flap(exports.Functor);
      var left = function(s) {
        return s.left;
      };
      exports.left = left;
      var right = function(s) {
        return s.right;
      };
      exports.right = right;
    }
  });

  // node_modules/fp-ts/lib/Witherable.js
  var require_Witherable = __commonJS({
    "node_modules/fp-ts/lib/Witherable.js"(exports) {
      "use strict";
      var __createBinding = exports && exports.__createBinding || (Object.create ? function(o, m, k, k2) {
        if (k2 === void 0)
          k2 = k;
        Object.defineProperty(o, k2, { enumerable: true, get: function() {
          return m[k];
        } });
      } : function(o, m, k, k2) {
        if (k2 === void 0)
          k2 = k;
        o[k2] = m[k];
      });
      var __setModuleDefault = exports && exports.__setModuleDefault || (Object.create ? function(o, v) {
        Object.defineProperty(o, "default", { enumerable: true, value: v });
      } : function(o, v) {
        o["default"] = v;
      });
      var __importStar = exports && exports.__importStar || function(mod) {
        if (mod && mod.__esModule)
          return mod;
        var result = {};
        if (mod != null) {
          for (var k in mod)
            if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k))
              __createBinding(result, mod, k);
        }
        __setModuleDefault(result, mod);
        return result;
      };
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.filterE = exports.witherDefault = exports.wiltDefault = void 0;
      var _ = __importStar(require_internal());
      function wiltDefault(T, C) {
        return function(F) {
          var traverseF = T.traverse(F);
          return function(wa, f) {
            return F.map(traverseF(wa, f), C.separate);
          };
        };
      }
      exports.wiltDefault = wiltDefault;
      function witherDefault(T, C) {
        return function(F) {
          var traverseF = T.traverse(F);
          return function(wa, f) {
            return F.map(traverseF(wa, f), C.compact);
          };
        };
      }
      exports.witherDefault = witherDefault;
      function filterE(W) {
        return function(F) {
          var witherF = W.wither(F);
          return function(predicate) {
            return function(ga) {
              return witherF(ga, function(a) {
                return F.map(predicate(a), function(b) {
                  return b ? _.some(a) : _.none;
                });
              });
            };
          };
        };
      }
      exports.filterE = filterE;
    }
  });

  // node_modules/fp-ts/lib/Zero.js
  var require_Zero = __commonJS({
    "node_modules/fp-ts/lib/Zero.js"(exports) {
      "use strict";
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.guard = void 0;
      function guard(F, P) {
        return function(b) {
          return b ? P.of(void 0) : F.zero();
        };
      }
      exports.guard = guard;
    }
  });

  // node_modules/fp-ts/lib/Option.js
  var require_Option = __commonJS({
    "node_modules/fp-ts/lib/Option.js"(exports) {
      "use strict";
      var __createBinding = exports && exports.__createBinding || (Object.create ? function(o, m, k, k2) {
        if (k2 === void 0)
          k2 = k;
        Object.defineProperty(o, k2, { enumerable: true, get: function() {
          return m[k];
        } });
      } : function(o, m, k, k2) {
        if (k2 === void 0)
          k2 = k;
        o[k2] = m[k];
      });
      var __setModuleDefault = exports && exports.__setModuleDefault || (Object.create ? function(o, v) {
        Object.defineProperty(o, "default", { enumerable: true, value: v });
      } : function(o, v) {
        o["default"] = v;
      });
      var __importStar = exports && exports.__importStar || function(mod) {
        if (mod && mod.__esModule)
          return mod;
        var result = {};
        if (mod != null) {
          for (var k in mod)
            if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k))
              __createBinding(result, mod, k);
        }
        __setModuleDefault(result, mod);
        return result;
      };
      Object.defineProperty(exports, "__esModule", { value: true });
      exports.fromEither = exports.MonadThrow = exports.throwError = exports.Witherable = exports.wilt = exports.wither = exports.Traversable = exports.sequence = exports.traverse = exports.Filterable = exports.partitionMap = exports.partition = exports.filterMap = exports.filter = exports.Compactable = exports.separate = exports.compact = exports.Extend = exports.extend = exports.Alternative = exports.guard = exports.Zero = exports.zero = exports.Alt = exports.alt = exports.altW = exports.Foldable = exports.reduceRight = exports.foldMap = exports.reduce = exports.Monad = exports.Chain = exports.chain = exports.Applicative = exports.Apply = exports.ap = exports.Pointed = exports.of = exports.Functor = exports.map = exports.getMonoid = exports.getOrd = exports.getEq = exports.getShow = exports.URI = exports.getRight = exports.getLeft = exports.fromPredicate = exports.some = exports.none = void 0;
      exports.getLastMonoid = exports.getFirstMonoid = exports.getApplyMonoid = exports.getApplySemigroup = exports.option = exports.mapNullable = exports.getRefinement = exports.sequenceArray = exports.traverseArray = exports.traverseArrayWithIndex = exports.traverseReadonlyArrayWithIndex = exports.traverseReadonlyNonEmptyArrayWithIndex = exports.ApT = exports.apS = exports.bind = exports.bindTo = exports.Do = exports.exists = exports.elem = exports.toUndefined = exports.toNullable = exports.chainNullableK = exports.fromNullableK = exports.tryCatchK = exports.tryCatch = exports.fromNullable = exports.chainEitherK = exports.fromEitherK = exports.duplicate = exports.chainFirst = exports.flatten = exports.apSecond = exports.apFirst = exports.flap = exports.getOrElse = exports.getOrElseW = exports.fold = exports.match = exports.foldW = exports.matchW = exports.isNone = exports.isSome = exports.FromEither = void 0;
      var Applicative_1 = require_Applicative();
      var Apply_1 = require_Apply();
      var Chain_1 = require_Chain();
      var FromEither_1 = require_FromEither();
      var function_1 = require_function();
      var Functor_1 = require_Functor();
      var _ = __importStar(require_internal());
      var Predicate_1 = require_Predicate();
      var Semigroup_1 = require_Semigroup();
      var Separated_1 = require_Separated();
      var Witherable_1 = require_Witherable();
      var Zero_1 = require_Zero();
      exports.none = _.none;
      exports.some = _.some;
      function fromPredicate(predicate) {
        return function(a) {
          return predicate(a) ? exports.some(a) : exports.none;
        };
      }
      exports.fromPredicate = fromPredicate;
      var getLeft = function(ma) {
        return ma._tag === "Right" ? exports.none : exports.some(ma.left);
      };
      exports.getLeft = getLeft;
      var getRight = function(ma) {
        return ma._tag === "Left" ? exports.none : exports.some(ma.right);
      };
      exports.getRight = getRight;
      var _map = function(fa, f) {
        return function_1.pipe(fa, exports.map(f));
      };
      var _ap = function(fab, fa) {
        return function_1.pipe(fab, exports.ap(fa));
      };
      var _chain = function(ma, f) {
        return function_1.pipe(ma, exports.chain(f));
      };
      var _reduce = function(fa, b, f) {
        return function_1.pipe(fa, exports.reduce(b, f));
      };
      var _foldMap = function(M) {
        var foldMapM = exports.foldMap(M);
        return function(fa, f) {
          return function_1.pipe(fa, foldMapM(f));
        };
      };
      var _reduceRight = function(fa, b, f) {
        return function_1.pipe(fa, exports.reduceRight(b, f));
      };
      var _traverse = function(F) {
        var traverseF = exports.traverse(F);
        return function(ta, f) {
          return function_1.pipe(ta, traverseF(f));
        };
      };
      var _alt = function(fa, that) {
        return function_1.pipe(fa, exports.alt(that));
      };
      var _filter = function(fa, predicate) {
        return function_1.pipe(fa, exports.filter(predicate));
      };
      var _filterMap = function(fa, f) {
        return function_1.pipe(fa, exports.filterMap(f));
      };
      var _extend = function(wa, f) {
        return function_1.pipe(wa, exports.extend(f));
      };
      var _partition = function(fa, predicate) {
        return function_1.pipe(fa, exports.partition(predicate));
      };
      var _partitionMap = function(fa, f) {
        return function_1.pipe(fa, exports.partitionMap(f));
      };
      exports.URI = "Option";
      var getShow = function(S) {
        return {
          show: function(ma) {
            return exports.isNone(ma) ? "none" : "some(" + S.show(ma.value) + ")";
          }
        };
      };
      exports.getShow = getShow;
      var getEq = function(E) {
        return {
          equals: function(x, y) {
            return x === y || (exports.isNone(x) ? exports.isNone(y) : exports.isNone(y) ? false : E.equals(x.value, y.value));
          }
        };
      };
      exports.getEq = getEq;
      var getOrd = function(O2) {
        return {
          equals: exports.getEq(O2).equals,
          compare: function(x, y) {
            return x === y ? 0 : exports.isSome(x) ? exports.isSome(y) ? O2.compare(x.value, y.value) : 1 : -1;
          }
        };
      };
      exports.getOrd = getOrd;
      var getMonoid = function(S) {
        return {
          concat: function(x, y) {
            return exports.isNone(x) ? y : exports.isNone(y) ? x : exports.some(S.concat(x.value, y.value));
          },
          empty: exports.none
        };
      };
      exports.getMonoid = getMonoid;
      var map = function(f) {
        return function(fa) {
          return exports.isNone(fa) ? exports.none : exports.some(f(fa.value));
        };
      };
      exports.map = map;
      exports.Functor = {
        URI: exports.URI,
        map: _map
      };
      exports.of = exports.some;
      exports.Pointed = {
        URI: exports.URI,
        of: exports.of
      };
      var ap = function(fa) {
        return function(fab) {
          return exports.isNone(fab) ? exports.none : exports.isNone(fa) ? exports.none : exports.some(fab.value(fa.value));
        };
      };
      exports.ap = ap;
      exports.Apply = {
        URI: exports.URI,
        map: _map,
        ap: _ap
      };
      exports.Applicative = {
        URI: exports.URI,
        map: _map,
        ap: _ap,
        of: exports.of
      };
      var chain2 = function(f) {
        return function(ma) {
          return exports.isNone(ma) ? exports.none : f(ma.value);
        };
      };
      exports.chain = chain2;
      exports.Chain = {
        URI: exports.URI,
        map: _map,
        ap: _ap,
        chain: _chain
      };
      exports.Monad = {
        URI: exports.URI,
        map: _map,
        ap: _ap,
        of: exports.of,
        chain: _chain
      };
      var reduce = function(b, f) {
        return function(fa) {
          return exports.isNone(fa) ? b : f(b, fa.value);
        };
      };
      exports.reduce = reduce;
      var foldMap = function(M) {
        return function(f) {
          return function(fa) {
            return exports.isNone(fa) ? M.empty : f(fa.value);
          };
        };
      };
      exports.foldMap = foldMap;
      var reduceRight = function(b, f) {
        return function(fa) {
          return exports.isNone(fa) ? b : f(fa.value, b);
        };
      };
      exports.reduceRight = reduceRight;
      exports.Foldable = {
        URI: exports.URI,
        reduce: _reduce,
        foldMap: _foldMap,
        reduceRight: _reduceRight
      };
      var altW = function(that) {
        return function(fa) {
          return exports.isNone(fa) ? that() : fa;
        };
      };
      exports.altW = altW;
      exports.alt = exports.altW;
      exports.Alt = {
        URI: exports.URI,
        map: _map,
        alt: _alt
      };
      var zero = function() {
        return exports.none;
      };
      exports.zero = zero;
      exports.Zero = {
        URI: exports.URI,
        zero: exports.zero
      };
      exports.guard = /* @__PURE__ */ Zero_1.guard(exports.Zero, exports.Pointed);
      exports.Alternative = {
        URI: exports.URI,
        map: _map,
        ap: _ap,
        of: exports.of,
        alt: _alt,
        zero: exports.zero
      };
      var extend = function(f) {
        return function(wa) {
          return exports.isNone(wa) ? exports.none : exports.some(f(wa));
        };
      };
      exports.extend = extend;
      exports.Extend = {
        URI: exports.URI,
        map: _map,
        extend: _extend
      };
      exports.compact = /* @__PURE__ */ exports.chain(function_1.identity);
      var defaultSeparated = /* @__PURE__ */ Separated_1.separated(exports.none, exports.none);
      var separate = function(ma) {
        return exports.isNone(ma) ? defaultSeparated : Separated_1.separated(exports.getLeft(ma.value), exports.getRight(ma.value));
      };
      exports.separate = separate;
      exports.Compactable = {
        URI: exports.URI,
        compact: exports.compact,
        separate: exports.separate
      };
      var filter = function(predicate) {
        return function(fa) {
          return exports.isNone(fa) ? exports.none : predicate(fa.value) ? fa : exports.none;
        };
      };
      exports.filter = filter;
      var filterMap = function(f) {
        return function(fa) {
          return exports.isNone(fa) ? exports.none : f(fa.value);
        };
      };
      exports.filterMap = filterMap;
      var partition = function(predicate) {
        return function(fa) {
          return Separated_1.separated(_filter(fa, Predicate_1.not(predicate)), _filter(fa, predicate));
        };
      };
      exports.partition = partition;
      var partitionMap = function(f) {
        return function_1.flow(exports.map(f), exports.separate);
      };
      exports.partitionMap = partitionMap;
      exports.Filterable = {
        URI: exports.URI,
        map: _map,
        compact: exports.compact,
        separate: exports.separate,
        filter: _filter,
        filterMap: _filterMap,
        partition: _partition,
        partitionMap: _partitionMap
      };
      var traverse = function(F) {
        return function(f) {
          return function(ta) {
            return exports.isNone(ta) ? F.of(exports.none) : F.map(f(ta.value), exports.some);
          };
        };
      };
      exports.traverse = traverse;
      var sequence = function(F) {
        return function(ta) {
          return exports.isNone(ta) ? F.of(exports.none) : F.map(ta.value, exports.some);
        };
      };
      exports.sequence = sequence;
      exports.Traversable = {
        URI: exports.URI,
        map: _map,
        reduce: _reduce,
        foldMap: _foldMap,
        reduceRight: _reduceRight,
        traverse: _traverse,
        sequence: exports.sequence
      };
      var _wither = /* @__PURE__ */ Witherable_1.witherDefault(exports.Traversable, exports.Compactable);
      var _wilt = /* @__PURE__ */ Witherable_1.wiltDefault(exports.Traversable, exports.Compactable);
      var wither = function(F) {
        var _witherF = _wither(F);
        return function(f) {
          return function(fa) {
            return _witherF(fa, f);
          };
        };
      };
      exports.wither = wither;
      var wilt = function(F) {
        var _wiltF = _wilt(F);
        return function(f) {
          return function(fa) {
            return _wiltF(fa, f);
          };
        };
      };
      exports.wilt = wilt;
      exports.Witherable = {
        URI: exports.URI,
        map: _map,
        reduce: _reduce,
        foldMap: _foldMap,
        reduceRight: _reduceRight,
        traverse: _traverse,
        sequence: exports.sequence,
        compact: exports.compact,
        separate: exports.separate,
        filter: _filter,
        filterMap: _filterMap,
        partition: _partition,
        partitionMap: _partitionMap,
        wither: _wither,
        wilt: _wilt
      };
      var throwError = function() {
        return exports.none;
      };
      exports.throwError = throwError;
      exports.MonadThrow = {
        URI: exports.URI,
        map: _map,
        ap: _ap,
        of: exports.of,
        chain: _chain,
        throwError: exports.throwError
      };
      exports.fromEither = exports.getRight;
      exports.FromEither = {
        URI: exports.URI,
        fromEither: exports.fromEither
      };
      exports.isSome = _.isSome;
      var isNone = function(fa) {
        return fa._tag === "None";
      };
      exports.isNone = isNone;
      var matchW = function(onNone, onSome) {
        return function(ma) {
          return exports.isNone(ma) ? onNone() : onSome(ma.value);
        };
      };
      exports.matchW = matchW;
      exports.foldW = exports.matchW;
      exports.match = exports.matchW;
      exports.fold = exports.match;
      var getOrElseW = function(onNone) {
        return function(ma) {
          return exports.isNone(ma) ? onNone() : ma.value;
        };
      };
      exports.getOrElseW = getOrElseW;
      exports.getOrElse = exports.getOrElseW;
      exports.flap = /* @__PURE__ */ Functor_1.flap(exports.Functor);
      exports.apFirst = /* @__PURE__ */ Apply_1.apFirst(exports.Apply);
      exports.apSecond = /* @__PURE__ */ Apply_1.apSecond(exports.Apply);
      exports.flatten = exports.compact;
      exports.chainFirst = /* @__PURE__ */ Chain_1.chainFirst(exports.Chain);
      exports.duplicate = /* @__PURE__ */ exports.extend(function_1.identity);
      exports.fromEitherK = /* @__PURE__ */ FromEither_1.fromEitherK(exports.FromEither);
      exports.chainEitherK = /* @__PURE__ */ FromEither_1.chainEitherK(exports.FromEither, exports.Chain);
      var fromNullable2 = function(a) {
        return a == null ? exports.none : exports.some(a);
      };
      exports.fromNullable = fromNullable2;
      var tryCatch2 = function(f) {
        try {
          return exports.some(f());
        } catch (e) {
          return exports.none;
        }
      };
      exports.tryCatch = tryCatch2;
      var tryCatchK = function(f) {
        return function() {
          var a = [];
          for (var _i = 0; _i < arguments.length; _i++) {
            a[_i] = arguments[_i];
          }
          return exports.tryCatch(function() {
            return f.apply(void 0, a);
          });
        };
      };
      exports.tryCatchK = tryCatchK;
      var fromNullableK = function(f) {
        return function_1.flow(f, exports.fromNullable);
      };
      exports.fromNullableK = fromNullableK;
      var chainNullableK = function(f) {
        return function(ma) {
          return exports.isNone(ma) ? exports.none : exports.fromNullable(f(ma.value));
        };
      };
      exports.chainNullableK = chainNullableK;
      exports.toNullable = /* @__PURE__ */ exports.match(function_1.constNull, function_1.identity);
      exports.toUndefined = /* @__PURE__ */ exports.match(function_1.constUndefined, function_1.identity);
      function elem(E) {
        return function(a, ma) {
          if (ma === void 0) {
            var elemE_1 = elem(E);
            return function(ma2) {
              return elemE_1(a, ma2);
            };
          }
          return exports.isNone(ma) ? false : E.equals(a, ma.value);
        };
      }
      exports.elem = elem;
      var exists = function(predicate) {
        return function(ma) {
          return exports.isNone(ma) ? false : predicate(ma.value);
        };
      };
      exports.exists = exists;
      exports.Do = /* @__PURE__ */ exports.of(_.emptyRecord);
      exports.bindTo = /* @__PURE__ */ Functor_1.bindTo(exports.Functor);
      exports.bind = /* @__PURE__ */ Chain_1.bind(exports.Chain);
      exports.apS = /* @__PURE__ */ Apply_1.apS(exports.Apply);
      exports.ApT = /* @__PURE__ */ exports.of(_.emptyReadonlyArray);
      var traverseReadonlyNonEmptyArrayWithIndex = function(f) {
        return function(as) {
          var o = f(0, _.head(as));
          if (exports.isNone(o)) {
            return exports.none;
          }
          var out = [o.value];
          for (var i = 1; i < as.length; i++) {
            var o_1 = f(i, as[i]);
            if (exports.isNone(o_1)) {
              return exports.none;
            }
            out.push(o_1.value);
          }
          return exports.some(out);
        };
      };
      exports.traverseReadonlyNonEmptyArrayWithIndex = traverseReadonlyNonEmptyArrayWithIndex;
      var traverseReadonlyArrayWithIndex = function(f) {
        var g = exports.traverseReadonlyNonEmptyArrayWithIndex(f);
        return function(as) {
          return _.isNonEmpty(as) ? g(as) : exports.ApT;
        };
      };
      exports.traverseReadonlyArrayWithIndex = traverseReadonlyArrayWithIndex;
      exports.traverseArrayWithIndex = exports.traverseReadonlyArrayWithIndex;
      var traverseArray = function(f) {
        return exports.traverseReadonlyArrayWithIndex(function(_2, a) {
          return f(a);
        });
      };
      exports.traverseArray = traverseArray;
      exports.sequenceArray = /* @__PURE__ */ exports.traverseArray(function_1.identity);
      function getRefinement(getOption) {
        return function(a) {
          return exports.isSome(getOption(a));
        };
      }
      exports.getRefinement = getRefinement;
      exports.mapNullable = exports.chainNullableK;
      exports.option = {
        URI: exports.URI,
        map: _map,
        of: exports.of,
        ap: _ap,
        chain: _chain,
        reduce: _reduce,
        foldMap: _foldMap,
        reduceRight: _reduceRight,
        traverse: _traverse,
        sequence: exports.sequence,
        zero: exports.zero,
        alt: _alt,
        extend: _extend,
        compact: exports.compact,
        separate: exports.separate,
        filter: _filter,
        filterMap: _filterMap,
        partition: _partition,
        partitionMap: _partitionMap,
        wither: _wither,
        wilt: _wilt,
        throwError: exports.throwError
      };
      exports.getApplySemigroup = /* @__PURE__ */ Apply_1.getApplySemigroup(exports.Apply);
      exports.getApplyMonoid = /* @__PURE__ */ Applicative_1.getApplicativeMonoid(exports.Applicative);
      var getFirstMonoid = function() {
        return exports.getMonoid(Semigroup_1.first());
      };
      exports.getFirstMonoid = getFirstMonoid;
      var getLastMonoid = function() {
        return exports.getMonoid(Semigroup_1.last());
      };
      exports.getLastMonoid = getLastMonoid;
    }
  });

  // node_modules/@turf/helpers/dist/es/index.js
  var earthRadius = 63710088e-1;
  var factors = {
    centimeters: earthRadius * 100,
    centimetres: earthRadius * 100,
    degrees: earthRadius / 111325,
    feet: earthRadius * 3.28084,
    inches: earthRadius * 39.37,
    kilometers: earthRadius / 1e3,
    kilometres: earthRadius / 1e3,
    meters: earthRadius,
    metres: earthRadius,
    miles: earthRadius / 1609.344,
    millimeters: earthRadius * 1e3,
    millimetres: earthRadius * 1e3,
    nauticalmiles: earthRadius / 1852,
    radians: 1,
    yards: earthRadius * 1.0936
  };
  var unitsFactors = {
    centimeters: 100,
    centimetres: 100,
    degrees: 1 / 111325,
    feet: 3.28084,
    inches: 39.37,
    kilometers: 1 / 1e3,
    kilometres: 1 / 1e3,
    meters: 1,
    metres: 1,
    miles: 1 / 1609.344,
    millimeters: 1e3,
    millimetres: 1e3,
    nauticalmiles: 1 / 1852,
    radians: 1 / earthRadius,
    yards: 1.0936133
  };
  function feature(geom, properties, options) {
    if (options === void 0) {
      options = {};
    }
    var feat = { type: "Feature" };
    if (options.id === 0 || options.id) {
      feat.id = options.id;
    }
    if (options.bbox) {
      feat.bbox = options.bbox;
    }
    feat.properties = properties || {};
    feat.geometry = geom;
    return feat;
  }
  function point(coordinates, properties, options) {
    if (options === void 0) {
      options = {};
    }
    if (!coordinates) {
      throw new Error("coordinates is required");
    }
    if (!Array.isArray(coordinates)) {
      throw new Error("coordinates must be an Array");
    }
    if (coordinates.length < 2) {
      throw new Error("coordinates must be at least 2 numbers long");
    }
    if (!isNumber(coordinates[0]) || !isNumber(coordinates[1])) {
      throw new Error("coordinates must contain numbers");
    }
    var geom = {
      type: "Point",
      coordinates
    };
    return feature(geom, properties, options);
  }
  function lineString(coordinates, properties, options) {
    if (options === void 0) {
      options = {};
    }
    if (coordinates.length < 2) {
      throw new Error("coordinates must be an array of two or more positions");
    }
    var geom = {
      type: "LineString",
      coordinates
    };
    return feature(geom, properties, options);
  }
  function featureCollection(features, options) {
    if (options === void 0) {
      options = {};
    }
    var fc = { type: "FeatureCollection" };
    if (options.id) {
      fc.id = options.id;
    }
    if (options.bbox) {
      fc.bbox = options.bbox;
    }
    fc.features = features;
    return fc;
  }
  function radiansToLength(radians, units) {
    if (units === void 0) {
      units = "kilometers";
    }
    var factor = factors[units];
    if (!factor) {
      throw new Error(units + " units is invalid");
    }
    return radians * factor;
  }
  function lengthToRadians(distance2, units) {
    if (units === void 0) {
      units = "kilometers";
    }
    var factor = factors[units];
    if (!factor) {
      throw new Error(units + " units is invalid");
    }
    return distance2 / factor;
  }
  function radiansToDegrees(radians) {
    var degrees = radians % (2 * Math.PI);
    return degrees * 180 / Math.PI;
  }
  function degreesToRadians(degrees) {
    var radians = degrees % 360;
    return radians * Math.PI / 180;
  }
  function isNumber(num) {
    return !isNaN(num) && num !== null && !Array.isArray(num);
  }

  // node_modules/@turf/invariant/dist/es/index.js
  function getCoord(coord) {
    if (!coord) {
      throw new Error("coord is required");
    }
    if (!Array.isArray(coord)) {
      if (coord.type === "Feature" && coord.geometry !== null && coord.geometry.type === "Point") {
        return coord.geometry.coordinates;
      }
      if (coord.type === "Point") {
        return coord.coordinates;
      }
    }
    if (Array.isArray(coord) && coord.length >= 2 && !Array.isArray(coord[0]) && !Array.isArray(coord[1])) {
      return coord;
    }
    throw new Error("coord must be GeoJSON Point or an Array of numbers");
  }
  function getCoords(coords) {
    if (Array.isArray(coords)) {
      return coords;
    }
    if (coords.type === "Feature") {
      if (coords.geometry !== null) {
        return coords.geometry.coordinates;
      }
    } else {
      if (coords.coordinates) {
        return coords.coordinates;
      }
    }
    throw new Error("coords must be GeoJSON Feature, Geometry Object or an Array");
  }
  function getType(geojson, _name) {
    if (geojson.type === "FeatureCollection") {
      return "FeatureCollection";
    }
    if (geojson.type === "GeometryCollection") {
      return "GeometryCollection";
    }
    if (geojson.type === "Feature" && geojson.geometry !== null) {
      return geojson.geometry.type;
    }
    return geojson.type;
  }

  // node_modules/@turf/distance/dist/es/index.js
  function distance(from, to, options) {
    if (options === void 0) {
      options = {};
    }
    var coordinates1 = getCoord(from);
    var coordinates2 = getCoord(to);
    var dLat = degreesToRadians(coordinates2[1] - coordinates1[1]);
    var dLon = degreesToRadians(coordinates2[0] - coordinates1[0]);
    var lat1 = degreesToRadians(coordinates1[1]);
    var lat2 = degreesToRadians(coordinates2[1]);
    var a = Math.pow(Math.sin(dLat / 2), 2) + Math.pow(Math.sin(dLon / 2), 2) * Math.cos(lat1) * Math.cos(lat2);
    return radiansToLength(2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a)), options.units);
  }
  var es_default = distance;

  // node_modules/@turf/meta/dist/es/index.js
  function coordEach(geojson, callback, excludeWrapCoord) {
    if (geojson === null)
      return;
    var j, k, l, geometry, stopG, coords, geometryMaybeCollection, wrapShrink = 0, coordIndex = 0, isGeometryCollection, type = geojson.type, isFeatureCollection = type === "FeatureCollection", isFeature = type === "Feature", stop = isFeatureCollection ? geojson.features.length : 1;
    for (var featureIndex = 0; featureIndex < stop; featureIndex++) {
      geometryMaybeCollection = isFeatureCollection ? geojson.features[featureIndex].geometry : isFeature ? geojson.geometry : geojson;
      isGeometryCollection = geometryMaybeCollection ? geometryMaybeCollection.type === "GeometryCollection" : false;
      stopG = isGeometryCollection ? geometryMaybeCollection.geometries.length : 1;
      for (var geomIndex = 0; geomIndex < stopG; geomIndex++) {
        var multiFeatureIndex = 0;
        var geometryIndex = 0;
        geometry = isGeometryCollection ? geometryMaybeCollection.geometries[geomIndex] : geometryMaybeCollection;
        if (geometry === null)
          continue;
        coords = geometry.coordinates;
        var geomType = geometry.type;
        wrapShrink = excludeWrapCoord && (geomType === "Polygon" || geomType === "MultiPolygon") ? 1 : 0;
        switch (geomType) {
          case null:
            break;
          case "Point":
            if (callback(coords, coordIndex, featureIndex, multiFeatureIndex, geometryIndex) === false)
              return false;
            coordIndex++;
            multiFeatureIndex++;
            break;
          case "LineString":
          case "MultiPoint":
            for (j = 0; j < coords.length; j++) {
              if (callback(coords[j], coordIndex, featureIndex, multiFeatureIndex, geometryIndex) === false)
                return false;
              coordIndex++;
              if (geomType === "MultiPoint")
                multiFeatureIndex++;
            }
            if (geomType === "LineString")
              multiFeatureIndex++;
            break;
          case "Polygon":
          case "MultiLineString":
            for (j = 0; j < coords.length; j++) {
              for (k = 0; k < coords[j].length - wrapShrink; k++) {
                if (callback(coords[j][k], coordIndex, featureIndex, multiFeatureIndex, geometryIndex) === false)
                  return false;
                coordIndex++;
              }
              if (geomType === "MultiLineString")
                multiFeatureIndex++;
              if (geomType === "Polygon")
                geometryIndex++;
            }
            if (geomType === "Polygon")
              multiFeatureIndex++;
            break;
          case "MultiPolygon":
            for (j = 0; j < coords.length; j++) {
              geometryIndex = 0;
              for (k = 0; k < coords[j].length; k++) {
                for (l = 0; l < coords[j][k].length - wrapShrink; l++) {
                  if (callback(coords[j][k][l], coordIndex, featureIndex, multiFeatureIndex, geometryIndex) === false)
                    return false;
                  coordIndex++;
                }
                geometryIndex++;
              }
              multiFeatureIndex++;
            }
            break;
          case "GeometryCollection":
            for (j = 0; j < geometry.geometries.length; j++)
              if (coordEach(geometry.geometries[j], callback, excludeWrapCoord) === false)
                return false;
            break;
          default:
            throw new Error("Unknown Geometry Type");
        }
      }
    }
  }
  function featureEach(geojson, callback) {
    if (geojson.type === "Feature") {
      callback(geojson, 0);
    } else if (geojson.type === "FeatureCollection") {
      for (var i = 0; i < geojson.features.length; i++) {
        if (callback(geojson.features[i], i) === false)
          break;
      }
    }
  }
  function geomEach(geojson, callback) {
    var i, j, g, geometry, stopG, geometryMaybeCollection, isGeometryCollection, featureProperties, featureBBox, featureId, featureIndex = 0, isFeatureCollection = geojson.type === "FeatureCollection", isFeature = geojson.type === "Feature", stop = isFeatureCollection ? geojson.features.length : 1;
    for (i = 0; i < stop; i++) {
      geometryMaybeCollection = isFeatureCollection ? geojson.features[i].geometry : isFeature ? geojson.geometry : geojson;
      featureProperties = isFeatureCollection ? geojson.features[i].properties : isFeature ? geojson.properties : {};
      featureBBox = isFeatureCollection ? geojson.features[i].bbox : isFeature ? geojson.bbox : void 0;
      featureId = isFeatureCollection ? geojson.features[i].id : isFeature ? geojson.id : void 0;
      isGeometryCollection = geometryMaybeCollection ? geometryMaybeCollection.type === "GeometryCollection" : false;
      stopG = isGeometryCollection ? geometryMaybeCollection.geometries.length : 1;
      for (g = 0; g < stopG; g++) {
        geometry = isGeometryCollection ? geometryMaybeCollection.geometries[g] : geometryMaybeCollection;
        if (geometry === null) {
          if (callback(null, featureIndex, featureProperties, featureBBox, featureId) === false)
            return false;
          continue;
        }
        switch (geometry.type) {
          case "Point":
          case "LineString":
          case "MultiPoint":
          case "Polygon":
          case "MultiLineString":
          case "MultiPolygon": {
            if (callback(geometry, featureIndex, featureProperties, featureBBox, featureId) === false)
              return false;
            break;
          }
          case "GeometryCollection": {
            for (j = 0; j < geometry.geometries.length; j++) {
              if (callback(geometry.geometries[j], featureIndex, featureProperties, featureBBox, featureId) === false)
                return false;
            }
            break;
          }
          default:
            throw new Error("Unknown Geometry Type");
        }
      }
      featureIndex++;
    }
  }
  function flattenEach(geojson, callback) {
    geomEach(geojson, function(geometry, featureIndex, properties, bbox2, id) {
      var type = geometry === null ? null : geometry.type;
      switch (type) {
        case null:
        case "Point":
        case "LineString":
        case "Polygon":
          if (callback(feature(geometry, properties, { bbox: bbox2, id }), featureIndex, 0) === false)
            return false;
          return;
      }
      var geomType;
      switch (type) {
        case "MultiPoint":
          geomType = "Point";
          break;
        case "MultiLineString":
          geomType = "LineString";
          break;
        case "MultiPolygon":
          geomType = "Polygon";
          break;
      }
      for (var multiFeatureIndex = 0; multiFeatureIndex < geometry.coordinates.length; multiFeatureIndex++) {
        var coordinate = geometry.coordinates[multiFeatureIndex];
        var geom = {
          type: geomType,
          coordinates: coordinate
        };
        if (callback(feature(geom, properties), featureIndex, multiFeatureIndex) === false)
          return false;
      }
    });
  }
  function segmentEach(geojson, callback) {
    flattenEach(geojson, function(feature2, featureIndex, multiFeatureIndex) {
      var segmentIndex = 0;
      if (!feature2.geometry)
        return;
      var type = feature2.geometry.type;
      if (type === "Point" || type === "MultiPoint")
        return;
      var previousCoords;
      var previousFeatureIndex = 0;
      var previousMultiIndex = 0;
      var prevGeomIndex = 0;
      if (coordEach(feature2, function(currentCoord, coordIndex, featureIndexCoord, multiPartIndexCoord, geometryIndex) {
        if (previousCoords === void 0 || featureIndex > previousFeatureIndex || multiPartIndexCoord > previousMultiIndex || geometryIndex > prevGeomIndex) {
          previousCoords = currentCoord;
          previousFeatureIndex = featureIndex;
          previousMultiIndex = multiPartIndexCoord;
          prevGeomIndex = geometryIndex;
          segmentIndex = 0;
          return;
        }
        var currentSegment = lineString([previousCoords, currentCoord], feature2.properties);
        if (callback(currentSegment, featureIndex, multiFeatureIndex, geometryIndex, segmentIndex) === false)
          return false;
        segmentIndex++;
        previousCoords = currentCoord;
      }) === false)
        return false;
    });
  }
  function segmentReduce(geojson, callback, initialValue) {
    var previousValue = initialValue;
    var started = false;
    segmentEach(geojson, function(currentSegment, featureIndex, multiFeatureIndex, geometryIndex, segmentIndex) {
      if (started === false && initialValue === void 0)
        previousValue = currentSegment;
      else
        previousValue = callback(previousValue, currentSegment, featureIndex, multiFeatureIndex, geometryIndex, segmentIndex);
      started = true;
    });
    return previousValue;
  }

  // node_modules/@turf/length/dist/es/index.js
  function length(geojson, options) {
    if (options === void 0) {
      options = {};
    }
    return segmentReduce(geojson, function(previousValue, segment) {
      var coords = segment.geometry.coordinates;
      return previousValue + es_default(coords[0], coords[1], options);
    }, 0);
  }

  // node_modules/@turf/bearing/dist/es/index.js
  function bearing(start, end, options) {
    if (options === void 0) {
      options = {};
    }
    if (options.final === true) {
      return calculateFinalBearing(start, end);
    }
    var coordinates1 = getCoord(start);
    var coordinates2 = getCoord(end);
    var lon1 = degreesToRadians(coordinates1[0]);
    var lon2 = degreesToRadians(coordinates2[0]);
    var lat1 = degreesToRadians(coordinates1[1]);
    var lat2 = degreesToRadians(coordinates2[1]);
    var a = Math.sin(lon2 - lon1) * Math.cos(lat2);
    var b = Math.cos(lat1) * Math.sin(lat2) - Math.sin(lat1) * Math.cos(lat2) * Math.cos(lon2 - lon1);
    return radiansToDegrees(Math.atan2(a, b));
  }
  function calculateFinalBearing(start, end) {
    var bear = bearing(end, start);
    bear = (bear + 180) % 360;
    return bear;
  }

  // node_modules/@turf/destination/dist/es/index.js
  function destination(origin, distance2, bearing2, options) {
    if (options === void 0) {
      options = {};
    }
    var coordinates1 = getCoord(origin);
    var longitude1 = degreesToRadians(coordinates1[0]);
    var latitude1 = degreesToRadians(coordinates1[1]);
    var bearingRad = degreesToRadians(bearing2);
    var radians = lengthToRadians(distance2, options.units);
    var latitude2 = Math.asin(Math.sin(latitude1) * Math.cos(radians) + Math.cos(latitude1) * Math.sin(radians) * Math.cos(bearingRad));
    var longitude2 = longitude1 + Math.atan2(Math.sin(bearingRad) * Math.sin(radians) * Math.cos(latitude1), Math.cos(radians) - Math.sin(latitude1) * Math.sin(latitude2));
    var lng = radiansToDegrees(longitude2);
    var lat = radiansToDegrees(latitude2);
    return point([lng, lat], options.properties);
  }

  // node_modules/@turf/line-segment/dist/es/index.js
  function lineSegment(geojson) {
    if (!geojson) {
      throw new Error("geojson is required");
    }
    var results = [];
    flattenEach(geojson, function(feature2) {
      lineSegmentFeature(feature2, results);
    });
    return featureCollection(results);
  }
  function lineSegmentFeature(geojson, results) {
    var coords = [];
    var geometry = geojson.geometry;
    if (geometry !== null) {
      switch (geometry.type) {
        case "Polygon":
          coords = getCoords(geometry);
          break;
        case "LineString":
          coords = [getCoords(geometry)];
      }
      coords.forEach(function(coord) {
        var segments = createSegments(coord, geojson.properties);
        segments.forEach(function(segment) {
          segment.id = results.length;
          results.push(segment);
        });
      });
    }
  }
  function createSegments(coords, properties) {
    var segments = [];
    coords.reduce(function(previousCoords, currentCoords) {
      var segment = lineString([previousCoords, currentCoords], properties);
      segment.bbox = bbox(previousCoords, currentCoords);
      segments.push(segment);
      return currentCoords;
    });
    return segments;
  }
  function bbox(coords1, coords2) {
    var x1 = coords1[0];
    var y1 = coords1[1];
    var x2 = coords2[0];
    var y2 = coords2[1];
    var west = x1 < x2 ? x1 : x2;
    var south = y1 < y2 ? y1 : y2;
    var east = x1 > x2 ? x1 : x2;
    var north = y1 > y2 ? y1 : y2;
    return [west, south, east, north];
  }
  var es_default2 = lineSegment;

  // node_modules/@turf/line-intersect/dist/es/index.js
  var import_geojson_rbush = __toESM(require_geojson_rbush(), 1);
  function lineIntersect(line1, line2) {
    var unique = {};
    var results = [];
    if (line1.type === "LineString") {
      line1 = feature(line1);
    }
    if (line2.type === "LineString") {
      line2 = feature(line2);
    }
    if (line1.type === "Feature" && line2.type === "Feature" && line1.geometry !== null && line2.geometry !== null && line1.geometry.type === "LineString" && line2.geometry.type === "LineString" && line1.geometry.coordinates.length === 2 && line2.geometry.coordinates.length === 2) {
      var intersect = intersects(line1, line2);
      if (intersect) {
        results.push(intersect);
      }
      return featureCollection(results);
    }
    var tree = (0, import_geojson_rbush.default)();
    tree.load(es_default2(line2));
    featureEach(es_default2(line1), function(segment) {
      featureEach(tree.search(segment), function(match) {
        var intersect2 = intersects(segment, match);
        if (intersect2) {
          var key = getCoords(intersect2).join(",");
          if (!unique[key]) {
            unique[key] = true;
            results.push(intersect2);
          }
        }
      });
    });
    return featureCollection(results);
  }
  function intersects(line1, line2) {
    var coords1 = getCoords(line1);
    var coords2 = getCoords(line2);
    if (coords1.length !== 2) {
      throw new Error("<intersects> line1 must only contain 2 coordinates");
    }
    if (coords2.length !== 2) {
      throw new Error("<intersects> line2 must only contain 2 coordinates");
    }
    var x1 = coords1[0][0];
    var y1 = coords1[0][1];
    var x2 = coords1[1][0];
    var y2 = coords1[1][1];
    var x3 = coords2[0][0];
    var y3 = coords2[0][1];
    var x4 = coords2[1][0];
    var y4 = coords2[1][1];
    var denom = (y4 - y3) * (x2 - x1) - (x4 - x3) * (y2 - y1);
    var numeA = (x4 - x3) * (y1 - y3) - (y4 - y3) * (x1 - x3);
    var numeB = (x2 - x1) * (y1 - y3) - (y2 - y1) * (x1 - x3);
    if (denom === 0) {
      if (numeA === 0 && numeB === 0) {
        return null;
      }
      return null;
    }
    var uA = numeA / denom;
    var uB = numeB / denom;
    if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
      var x = x1 + uA * (x2 - x1);
      var y = y1 + uA * (y2 - y1);
      return point([x, y]);
    }
    return null;
  }
  var es_default3 = lineIntersect;

  // node_modules/@turf/nearest-point-on-line/dist/es/index.js
  function nearestPointOnLine(lines, pt, options) {
    if (options === void 0) {
      options = {};
    }
    var closestPt = point([Infinity, Infinity], {
      dist: Infinity
    });
    var length2 = 0;
    flattenEach(lines, function(line) {
      var coords = getCoords(line);
      for (var i = 0; i < coords.length - 1; i++) {
        var start = point(coords[i]);
        start.properties.dist = es_default(pt, start, options);
        var stop_1 = point(coords[i + 1]);
        stop_1.properties.dist = es_default(pt, stop_1, options);
        var sectionLength = es_default(start, stop_1, options);
        var heightDistance = Math.max(start.properties.dist, stop_1.properties.dist);
        var direction = bearing(start, stop_1);
        var perpendicularPt1 = destination(pt, heightDistance, direction + 90, options);
        var perpendicularPt2 = destination(pt, heightDistance, direction - 90, options);
        var intersect = es_default3(lineString([
          perpendicularPt1.geometry.coordinates,
          perpendicularPt2.geometry.coordinates
        ]), lineString([start.geometry.coordinates, stop_1.geometry.coordinates]));
        var intersectPt = null;
        if (intersect.features.length > 0) {
          intersectPt = intersect.features[0];
          intersectPt.properties.dist = es_default(pt, intersectPt, options);
          intersectPt.properties.location = length2 + es_default(start, intersectPt, options);
        }
        if (start.properties.dist < closestPt.properties.dist) {
          closestPt = start;
          closestPt.properties.index = i;
          closestPt.properties.location = length2;
        }
        if (stop_1.properties.dist < closestPt.properties.dist) {
          closestPt = stop_1;
          closestPt.properties.index = i + 1;
          closestPt.properties.location = length2 + sectionLength;
        }
        if (intersectPt && intersectPt.properties.dist < closestPt.properties.dist) {
          closestPt = intersectPt;
          closestPt.properties.index = i;
        }
        length2 += sectionLength;
      }
    });
    return closestPt;
  }
  var es_default4 = nearestPointOnLine;

  // node_modules/@turf/line-slice/dist/es/index.js
  function lineSlice(startPt, stopPt, line) {
    var coords = getCoords(line);
    if (getType(line) !== "LineString")
      throw new Error("line must be a LineString");
    var startVertex = es_default4(line, startPt);
    var stopVertex = es_default4(line, stopPt);
    var ends;
    if (startVertex.properties.index <= stopVertex.properties.index) {
      ends = [startVertex, stopVertex];
    } else {
      ends = [stopVertex, startVertex];
    }
    var clipCoords = [ends[0].geometry.coordinates];
    for (var i = ends[0].properties.index + 1; i < ends[1].properties.index + 1; i++) {
      clipCoords.push(coords[i]);
    }
    clipCoords.push(ends[1].geometry.coordinates);
    return lineString(clipCoords, line.properties);
  }
  var es_default5 = lineSlice;

  // libs/shared/utils/src/lib/geometry/point-transformations.ts
  function convertPointToTurfPoint(point2) {
    return point([point2.lon, point2.lat]);
  }

  // libs/shared/utils/src/lib/geometry/line-calculations.ts
  var O = __toESM(require_Option());
  var import_function = __toESM(require_function());
  function distanceFromRoute(point2, path) {
    const tPoint = convertPointToTurfPoint(point2);
    const pointOnRoute = es_default4(path, tPoint);
    return Math.round(es_default(tPoint, pointOnRoute, { units: "kilometers" }) * 1e3);
  }
  function snappedLineSlice(start, end, path) {
    return es_default5(convertPointToTurfPoint(start), convertPointToTurfPoint(end), path);
  }
  function distanceOnLine(start, end, path) {
    const startDistanceFromPath = distanceFromRoute(start, path);
    const endDistanceFromPath = distanceFromRoute(end, path);
    const pathBetweenSnappedPoints = snappedLineSlice(start, end, path);
    const snappedPathLength = length(pathBetweenSnappedPoints, { units: "kilometers" }) * 1e3;
    return startDistanceFromPath + endDistanceFromPath + snappedPathLength;
  }
  var lineLengthInMeters = (lineCoordinates) => O.tryCatch(() => length(lineString(lineCoordinates), { units: "kilometers" }) * 1e3);
  var lineStringLengthInMeters = (line) => {
    var _a;
    return (0, import_function.pipe)(O.fromNullable((_a = line == null ? void 0 : line.geometry) == null ? void 0 : _a.coordinates), O.chain(lineLengthInMeters));
  };
  var distanceOnLineForFlutter = (start, end, path) => {
    return distanceOnLine(start, end, path).toString();
  };
  global.distanceOnLineForFlutter = distanceOnLineForFlutter;
})();
