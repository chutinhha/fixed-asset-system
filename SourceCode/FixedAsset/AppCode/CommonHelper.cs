
/// <summary>
///CommoanHelper 的摘要说明
/// </summary>
public static class CommonHelper
{
    /// <summary>
    /// 获取终端状态
    /// </summary>
    /// <param name="terminalState"></param>
    /// <returns></returns>
    public static string GetTerminalState(int? terminalState)
    {
        if (terminalState == null)
        {
            return "离线";
        }
        if (terminalState.Value == (int)BaseEnum.TerminalState.Online)
        {
            return "在线";
        }
        if (terminalState.Value == (int)BaseEnum.TerminalState.Offline)
        {
            return "离线";
        }

        return "离线";
    }

    /// <summary>
    /// 获取终端使用状态
    /// </summary>
    /// <param name="terminalState"></param>
    /// <returns></returns>
    public static string GetTerminalUseState(int? terminalUseState)
    {
        if (terminalUseState == null)
        {
            return "";
        }
        if (terminalUseState.Value == (int)BaseEnum.TerminalUseState.Online)
        {
            return "上架";
        }
        if (terminalUseState.Value == (int)BaseEnum.TerminalUseState.Offline)
        {
            return "下架";
        }
        if (terminalUseState.Value == (int)BaseEnum.TerminalUseState.UpdatingVersion)
        {
            return "维护中";
        }

        return "";
    }


    public static string GetTerminalTestState(int? terminalTestState)
    {
        if (terminalTestState == null)
        {
            return "";
        }
        if (terminalTestState.Value == (int)BaseEnum.TerminalTestState.WaitPass)
        {
            return "待测试";
        }
        if (terminalTestState.Value == (int)BaseEnum.TerminalTestState.NoPass)
        {
            return "未通过";
        }
        if (terminalTestState.Value == (int)BaseEnum.TerminalTestState.Passed)
        {
            return "已通过";
        }

        return "";
    }

}