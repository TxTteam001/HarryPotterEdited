using BepInEx;
using HarmonyLib;
using HarryPotter.Classes;
using System.Collections.Generic;
using HarryPotter.Classes.UI;
using TMPro;
using UnityEngine;
using System;
using Reactor;
using BepInEx.Unity.IL2CPP;
using InnerNet;
using HarryPotter.Classes.CustomHats;
using BepInEx.Logging;
using System.Reflection;
/*
using AmongUs.GameOptions;
using BepInEx.Configuration;
using Il2CppInterop.Runtime.Injection;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
//using HarryPotter.Attributes;
//using HarryPotter.Modules;
//using HarryPotter.Roles.Core;*/

namespace HarryPotter;




    [BepInPlugin(Id, "HarryPotter", VersionString)]
    [BepInProcess("Among Us.exe")]
    [BepInDependency(ReactorPlugin.Id)]

    public class Plugin : BasePlugin
    {
        public const string Id = "harry.potter.mod";
        public Harmony Harmony { get; } = new Harmony(Id);
        public const string VersionString = "25.3.15";
        public static Version Version = Version.Parse(VersionString);
        public static Plugin Instance;

        public override void Load()
        {
            Main.Instance = new Main();
            Instance = this;
            ModTranslation.Load();
            TaskInfoHandler.Instance = new TaskInfoHandler { AllInfo = new List<ImportantTextTask>() };
            PopupTMPHandler.Instance = new PopupTMPHandler { AllPopups = new List<TextMeshPro>() };
            Classes.Config.LoadOption();
            CustomHatManager.LoadHats();
            Harmony.PatchAll();
        }
    }

    [HarmonyPatch(typeof(StatsManager), nameof(StatsManager.AmBanned), MethodType.Getter)]
    public static class StatsManager_AmBanned
    { 
        static void Postfix(out bool __result)
        {
            __result = false;
        }
    }



[HarmonyPatch(typeof(PingTracker), nameof(PingTracker.Update))]
public static class PingTracker_Update
{
    private static void Postfix(PingTracker __instance)
    {
        AspectPosition position = __instance.GetComponent<AspectPosition>();
        var text2 = AmongUsClient.Instance.GameState != InnerNet.InnerNetClient.GameStates.Started ?
ModTranslation.getString("PingTracker_Update")
+ $"\n{__instance.text.text}" : "";
        __instance.text.text = $"<size=130%><color=#FFF319>Harry Potter</color><color=#ffaa00>Edited</color> v{Plugin.Version.ToString()}</size>\n{text2}";
        if (AmongUsClient.Instance.GameState == InnerNetClient.GameStates.Started)
        {
            __instance.text.alignment = TextAlignmentOptions.Top;
            position.Alignment = AspectPosition.EdgeAlignments.Top;
            position.DistanceFromEdge = new Vector3(1.5f, 0.11f, 0);
        }
        else
        {
            position.Alignment = AspectPosition.EdgeAlignments.LeftTop;
            __instance.text.alignment = TextAlignmentOptions.TopLeft;
            position.DistanceFromEdge = new Vector3(0.5f, 0.11f);
        }
    }
    //一些借鉴其他模组的功能(最爱的TONX)：

    //房间显示（实验性）
    public static List<string> TName_Snacks_CN = new() { "冰激凌", "奶茶", "巧克力", "蛋糕", "甜甜圈", "可乐", "柠檬水", "冰糖葫芦", "果冻", "糖果", "牛奶", "抹茶", "烧仙草", "菠萝包", "布丁", "椰子冻", "曲奇", "红豆土司", "三彩团子", "艾草团子", "泡芙", "可丽饼", "桃酥", "麻薯", "鸡蛋仔", "马卡龙", "雪梅娘", "炒酸奶", "蛋挞", "松饼", "西米露", "奶冻", "奶酥", "可颂", "奶糖" };
    //public static List<string> TName_Snacks_EN = new() { "Ice cream", "Milk tea", "Chocolate", "Cake", "Donut", "Coke", "Lemonade", "Candied haws", "Jelly", "Candy", "Milk", "Matcha", "Burning Grass Jelly", "Pineapple Bun", "Pudding", "Coconut Jelly", "Cookies", "Red Bean Toast", "Three Color Dumplings", "Wormwood Dumplings", "Puffs", "Can be Crepe", "Peach Crisp", "Mochi", "Egg Waffle", "Macaron", "Snow Plum Niang", "Fried Yogurt", "Egg Tart", "Muffin", "Sago Dew", "panna cotta", "soufflé", "croissant", "toffee" };

    

    //公告

    public static BepInEx.Logging.ManualLogSource Logger;
    private static MethodInfo[] allInitializers = null;
    /*private static LogHandler logger = Logger.Handler(nameof(InitializerAttribute<T>));
    {
        // 初回の初期化時に初期化メソッドを探す
        if private static object nameof(object value)
    {
        throw new NotImplementedException();
    }

    (allInitializers == null)
        {
            FindInitializers();
        }
        foreach internal class T
{
}
    */
internal class LogHandler
{
}

/*
(var initializer in allInitializers)
        {
            logger.Info($"初期化: {initializer.DeclaringType.Name}.{initializer.Name}");
            initializer.Invoke(null, null);
        }
    }

    Logger = BepInEx.Logging.Logger.CreateLogSource("HarryPotter");
        //HarryPotter.Logger.Enable();
        //HarryPotter.Logger.Disable("NotifyRoles");
        //HarryPotter.Logger.Disable("SwitchSystem");
        HarryPotter.Logger.Disable("ModNews");
        //HarryPotter.Logger.Disable("CustomRpcSender");
*/

}