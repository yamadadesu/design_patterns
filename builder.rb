
# ビルダー(Builder)：各メソッドのインタフェースを定める
# 具体ビルダー(ConcreteBuilder)：Builderが定めたインタフェースの実装
# ディレクタ(Director)：Builderで提供されているインタフェースのみを使用して処理を行う

# Builder
class WaterWithMaterialBuilder
    def initialize(class_name)
        @water_with_material = class_name.new(0, 0)
    end

    def add_material(material_amount)
        @water_with_material.add_material(material_amount)
    end

    def add_water(water_amount)
        @water_with_material.water += water_amount
    end

    def result
        @water_with_material
    end
end

# ConcreateBuilder
class SugarWater
    attr_accessor :water, :sugar
    def initialize(water, sugar)
        @water = water
        @sugar = sugar
    end

    def add_material(sugar_amount)
        @sugar += sugar_amount
    end
end

class SaltWater
    attr_accessor :water, :salt
    def initialize(water, salt)
        @water = water
        @salt  = salt
    end

    def add_material(salt_amount)
        @salt += salt_amount
    end
end


# Director
class Director
    def initialize(builder)
        @builder = builder
    end

    def cook
        @builder.add_water(150)
        @builder.add_material(90)
        @builder.add_water(300)
        @builder.add_material(35)
    end
end

builder = WaterWithMaterialBuilder.new(SugarWater)
directer = Director.new(builder)
directer.cook
p builder.result

builder = WaterWithMaterialBuilder.new(SaltWater)
directer = Director.new(builder)
directer.cook
p builder.result
